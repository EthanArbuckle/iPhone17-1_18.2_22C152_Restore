@interface CNMutableContact
+ (id)imageDataDescriptions;
+ (id)unifyContacts:(id)a3;
- (BOOL)hasChanges;
- (BOOL)imageDataAvailable;
- (BOOL)isUsingSharedPhoto;
- (BOOL)preferredForImage;
- (BOOL)preferredForName;
- (CGRect)cropRect;
- (CNActivityAlert)callAlert;
- (CNActivityAlert)textAlert;
- (CNContactKeyVector)availableKeyDescriptor;
- (CNContactType)contactType;
- (CNMutableContact)initWithContact:(id)a3;
- (CNSensitiveContentConfiguration)sensitiveContentConfiguration;
- (CNWallpaper)wallpaper;
- (CNWallpaperMetadata)wallpaperMetadata;
- (NSArray)addressingGrammars;
- (NSArray)addressingGrammarsEncrypted;
- (NSArray)calendarURIs;
- (NSArray)contactRelations;
- (NSArray)dates;
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)socialProfiles;
- (NSArray)urlAddresses;
- (NSData)cropRectHash;
- (NSData)externalRepresentation;
- (NSData)fullscreenImageData;
- (NSData)imageBackgroundColorsData;
- (NSData)imageData;
- (NSData)imageHash;
- (NSData)memojiMetadata;
- (NSData)syncImageData;
- (NSData)thumbnailImageData;
- (NSData)watchWallpaperImageData;
- (NSDate)creationDate;
- (NSDate)imageSyncFailedTime;
- (NSDate)modificationDate;
- (NSDate)wallpaperSyncFailedTime;
- (NSDateComponents)birthday;
- (NSDateComponents)nonGregorianBirthday;
- (NSString)cardDAVUID;
- (NSString)cropRectID;
- (NSString)departmentName;
- (NSString)downtimeWhitelist;
- (NSString)explicitDisplayName;
- (NSString)externalIdentifier;
- (NSString)externalImageURI;
- (NSString)externalModificationTag;
- (NSString)externalUUID;
- (NSString)familyName;
- (NSString)givenName;
- (NSString)imageType;
- (NSString)jobTitle;
- (NSString)linkIdentifier;
- (NSString)mapsData;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)note;
- (NSString)organizationName;
- (NSString)phonemeData;
- (NSString)phoneticFamilyName;
- (NSString)phoneticGivenName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticOrganizationName;
- (NSString)preferredApplePersonaIdentifier;
- (NSString)preferredChannel;
- (NSString)preferredLikenessSource;
- (NSString)previousFamilyName;
- (NSString)pronunciationFamilyName;
- (NSString)pronunciationGivenName;
- (NSString)searchIndex;
- (NSString)sectionForSortingByFamilyName;
- (NSString)sectionForSortingByGivenName;
- (NSString)wallpaperURI;
- (id)copyWithSelfAsSnapshot;
- (id)copyWithZone:(_NSZone *)a3;
- (id)freeze;
- (id)freezeWithSelfAsSnapshot;
- (int64_t)sharedPhotoDisplayPreference;
- (void)_setAddressingGrammars:(id)a3;
- (void)_setAddressingGrammarsEncrypted:(id)a3;
- (void)_setBirthday:(id)a3;
- (void)_setCalendarURIs:(id)a3;
- (void)_setCallAlert:(id)a3;
- (void)_setContactRelations:(id)a3;
- (void)_setCreationDate:(id)a3;
- (void)_setDates:(id)a3;
- (void)_setDepartmentName:(id)a3;
- (void)_setDowntimeWhitelist:(id)a3;
- (void)_setEmailAddresses:(id)a3;
- (void)_setExplicitDisplayName:(id)a3;
- (void)_setExternalIdentifier:(id)a3;
- (void)_setExternalImageURI:(id)a3;
- (void)_setExternalModificationTag:(id)a3;
- (void)_setExternalRepresentation:(id)a3;
- (void)_setExternalUUID:(id)a3;
- (void)_setFamilyName:(id)a3;
- (void)_setFullscreenImageData:(id)a3;
- (void)_setGivenName:(id)a3;
- (void)_setImageBackgroundColorsData:(id)a3;
- (void)_setImageData:(id)a3;
- (void)_setImageHash:(id)a3;
- (void)_setImageSyncFailedTime:(id)a3;
- (void)_setImageType:(id)a3;
- (void)_setInstantMessageAddresses:(id)a3;
- (void)_setJobTitle:(id)a3;
- (void)_setLinkIdentifier:(id)a3;
- (void)_setMapsData:(id)a3;
- (void)_setMemojiMetadata:(id)a3;
- (void)_setMiddleName:(id)a3;
- (void)_setModificationDate:(id)a3;
- (void)_setNamePrefix:(id)a3;
- (void)_setNameSuffix:(id)a3;
- (void)_setNickname:(id)a3;
- (void)_setNonGregorianBirthday:(id)a3;
- (void)_setNote:(id)a3;
- (void)_setOrganizationName:(id)a3;
- (void)_setPhoneNumbers:(id)a3;
- (void)_setPhonemeData:(id)a3;
- (void)_setPhoneticFamilyName:(id)a3;
- (void)_setPhoneticGivenName:(id)a3;
- (void)_setPhoneticMiddleName:(id)a3;
- (void)_setPhoneticOrganizationName:(id)a3;
- (void)_setPostalAddresses:(id)a3;
- (void)_setPreferredApplePersonaIdentifier:(id)a3;
- (void)_setPreferredChannel:(id)a3;
- (void)_setPreferredLikenessSource:(id)a3;
- (void)_setPreviousFamilyName:(id)a3;
- (void)_setPronunciationFamilyName:(id)a3;
- (void)_setPronunciationGivenName:(id)a3;
- (void)_setSearchIndex:(id)a3;
- (void)_setSectionForSortingByFamilyName:(id)a3;
- (void)_setSectionForSortingByGivenName:(id)a3;
- (void)_setSensitiveContentConfiguration:(id)a3;
- (void)_setSocialProfiles:(id)a3;
- (void)_setSyncImageData:(id)a3;
- (void)_setTextAlert:(id)a3;
- (void)_setThumbnailImageData:(id)a3;
- (void)_setUrlAddresses:(id)a3;
- (void)_setWallpaper:(id)a3;
- (void)_setWallpaperMetadata:(id)a3;
- (void)_setWallpaperSyncFailedTime:(id)a3;
- (void)_setWallpaperURI:(id)a3;
- (void)_setWatchWallpaperImageData:(id)a3;
- (void)overwriteStateFromContact:(id)a3;
- (void)removeKeys:(id)a3;
- (void)resetIsUsingSharedPhoto;
- (void)resetToNewContact;
- (void)setAddressingGrammars:(id)a3;
- (void)setAddressingGrammarsEncrypted:(id)a3;
- (void)setAvailableKeyDescriptor:(id)a3;
- (void)setBirthday:(NSDateComponents *)birthday;
- (void)setCalendarURIs:(id)a3;
- (void)setCallAlert:(id)a3;
- (void)setCardDAVUID:(id)a3;
- (void)setContactRelations:(NSArray *)contactRelations;
- (void)setContactType:(CNContactType)contactType;
- (void)setCreationDate:(id)a3;
- (void)setCropRect:(CGRect)a3;
- (void)setCropRectHash:(id)a3;
- (void)setCropRectID:(id)a3;
- (void)setDates:(NSArray *)dates;
- (void)setDepartmentName:(NSString *)departmentName;
- (void)setDowntimeWhitelist:(id)a3;
- (void)setEmailAddresses:(NSArray *)emailAddresses;
- (void)setExplicitDisplayName:(id)a3;
- (void)setExternalIdentifier:(id)a3;
- (void)setExternalImageURI:(id)a3;
- (void)setExternalModificationTag:(id)a3;
- (void)setExternalRepresentation:(id)a3;
- (void)setExternalUUID:(id)a3;
- (void)setFamilyName:(NSString *)familyName;
- (void)setFlags:(unint64_t)a3;
- (void)setFrozenSelfAsSnapshot;
- (void)setFullscreenImageData:(id)a3;
- (void)setGivenName:(NSString *)givenName;
- (void)setIOSLegacyIdentifier:(int)a3;
- (void)setImageBackgroundColorsData:(id)a3;
- (void)setImageData:(NSData *)imageData;
- (void)setImageDataAvailable:(BOOL)a3;
- (void)setImageHash:(id)a3;
- (void)setImageSyncFailedTime:(id)a3;
- (void)setImageType:(id)a3;
- (void)setImplicitAugmentation:(BOOL)a3;
- (void)setInstantMessageAddresses:(NSArray *)instantMessageAddresses;
- (void)setIsUsingSharedPhoto:(BOOL)a3;
- (void)setJobTitle:(NSString *)jobTitle;
- (void)setLinkIdentifier:(id)a3;
- (void)setLinkedContacts:(id)a3;
- (void)setMapsData:(id)a3;
- (void)setMemojiMetadata:(id)a3;
- (void)setMiddleName:(NSString *)middleName;
- (void)setModificationDate:(id)a3;
- (void)setNamePrefix:(NSString *)namePrefix;
- (void)setNameSuffix:(NSString *)nameSuffix;
- (void)setNickname:(NSString *)nickname;
- (void)setNilValueForKey:(id)a3;
- (void)setNonGregorianBirthday:(NSDateComponents *)nonGregorianBirthday;
- (void)setNote:(NSString *)note;
- (void)setOrganizationName:(NSString *)organizationName;
- (void)setPhoneNumbers:(NSArray *)phoneNumbers;
- (void)setPhonemeData:(id)a3;
- (void)setPhoneticFamilyName:(NSString *)phoneticFamilyName;
- (void)setPhoneticGivenName:(NSString *)phoneticGivenName;
- (void)setPhoneticMiddleName:(NSString *)phoneticMiddleName;
- (void)setPhoneticOrganizationName:(NSString *)phoneticOrganizationName;
- (void)setPostalAddresses:(NSArray *)postalAddresses;
- (void)setPreferredApplePersonaIdentifier:(id)a3;
- (void)setPreferredChannel:(id)a3;
- (void)setPreferredForImage:(BOOL)a3;
- (void)setPreferredForName:(BOOL)a3;
- (void)setPreferredLikenessSource:(id)a3;
- (void)setPreviousFamilyName:(NSString *)previousFamilyName;
- (void)setPronunciationFamilyName:(id)a3;
- (void)setPronunciationGivenName:(id)a3;
- (void)setRelatedNames:(id)a3;
- (void)setSearchIndex:(id)a3;
- (void)setSectionForSortingByFamilyName:(id)a3;
- (void)setSectionForSortingByGivenName:(id)a3;
- (void)setSensitiveContentConfiguration:(id)a3;
- (void)setSharedPhotoDisplayPreference:(int64_t)a3;
- (void)setSnapshot:(id)a3;
- (void)setSocialProfiles:(NSArray *)socialProfiles;
- (void)setStoreIdentifier:(id)a3;
- (void)setStoreInfo:(id)a3;
- (void)setSyncImageData:(id)a3;
- (void)setTextAlert:(id)a3;
- (void)setThumbnailImageData:(id)a3;
- (void)setUrlAddresses:(NSArray *)urlAddresses;
- (void)setWallpaper:(id)a3;
- (void)setWallpaperMetadata:(id)a3;
- (void)setWallpaperSyncFailedTime:(id)a3;
- (void)setWallpaperURI:(id)a3;
- (void)setWatchWallpaperImageData:(id)a3;
- (void)updateImageDataAvailableFromCurrentState;
- (void)updateStateFromContact:(id)a3;
- (void)updateWithSharedProfile:(id)a3;
@end

@implementation CNMutableContact

- (id)freeze
{
  v3 = (objc_class *)objc_opt_class();
  object_setClass(self, v3);
  return self;
}

- (id)freezeWithSelfAsSnapshot
{
  v3 = [MEMORY[0x1E4F1CA98] null];
  [(CNMutableContact *)self setSnapshot:v3];

  return [(CNMutableContact *)self freeze];
}

- (void)setSnapshot:(id)a3
{
  snapshot = self->super._snapshot;
  if (snapshot != a3)
  {
    self->super._snapshot = 0;
    id v5 = a3;

    v6 = (CNContact *)[v5 copy];
    v7 = self->super._snapshot;
    self->super._snapshot = v6;
  }
}

- (void)setAvailableKeyDescriptor:(id)a3
{
  self->super._availableKeyDescriptor = (CNContactKeyVector *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (void)setIOSLegacyIdentifier:(int)a3
{
  self->super._iOSLegacyIdentifier = a3;
}

- (void)_setEmailAddresses:(id)a3
{
  v4 = (NSArray *)a3;
  p_emailAddresses = &self->super._emailAddresses;
  if (*p_emailAddresses != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_emailAddresses, v4);
    v4 = obj;
  }
}

- (void)_setPhoneNumbers:(id)a3
{
  v4 = (NSArray *)a3;
  p_phoneNumbers = &self->super._phoneNumbers;
  if (*p_phoneNumbers != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_phoneNumbers, v4);
    v4 = obj;
  }
}

- (void)setPreferredForName:(BOOL)a3
{
  if (self->super._preferredForName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredForName"])
  {
    self->super._preferredForName = a3;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setLinkIdentifier:(id)a3
{
}

- (void)_setGivenName:(id)a3
{
}

- (void)_setFamilyName:(id)a3
{
}

- (void)setContactType:(CNContactType)contactType
{
  if (self->super._contactType
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"contactType"])
  {
    self->super._contactType = contactType;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setOrganizationName:(id)a3
{
}

- (void)setLinkedContacts:(id)a3
{
  if (self->super._linkedContacts != a3)
  {
    v4 = (objc_class *)MEMORY[0x1E4F1C978];
    id v5 = a3;
    v6 = (NSArray *)[[v4 alloc] initWithArray:v5];

    linkedContacts = self->super._linkedContacts;
    self->super._linkedContacts = v6;
  }
}

- (void)setOrganizationName:(NSString *)organizationName
{
  v8 = organizationName;
  if (self->super._organizationName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"organizationName"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"organizationName"];
    [v5 assertValueType:v8];

    v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setOrganizationName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setGivenName:(NSString *)givenName
{
  v8 = givenName;
  if (self->super._givenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"givenName"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"givenName"];
    [v5 assertValueType:v8];

    v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setGivenName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setFamilyName:(NSString *)familyName
{
  v8 = familyName;
  if (self->super._familyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"familyName"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"familyName"];
    [v5 assertValueType:v8];

    v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setFamilyName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (NSString)phoneticFamilyName
{
  v3 = self->super._phoneticFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticFamilyName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (void)setThumbnailImageData:(id)a3
{
  id v8 = a3;
  if (self->super._thumbnailImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"thumbnailImageData"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"thumbnailImageData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setThumbnailImageData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setIsUsingSharedPhoto:(BOOL)a3
{
  self->super._isUsingSharedPhoto = a3;
}

- (void)setLinkIdentifier:(id)a3
{
  id v8 = a3;
  if (self->super._linkIdentifier
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"linkIdentifier"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"linkIdentifier"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setLinkIdentifier:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setEmailAddresses:(NSArray *)emailAddresses
{
  v4 = emailAddresses;
  id v5 = self->super._emailAddresses;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"emailAddresses"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setEmailAddresses:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"emailAddresses"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"emailAddresses"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setPhoneNumbers:(NSArray *)phoneNumbers
{
  v4 = phoneNumbers;
  id v5 = self->super._phoneNumbers;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"phoneNumbers"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setPhoneNumbers:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneNumbers"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"phoneNumbers"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)resetIsUsingSharedPhoto
{
  if ([(CNContact *)self isKeyAvailable:@"isUsingSharedPhoto"])
  {
    [(CNMutableContact *)self setIsUsingSharedPhoto:0];
  }
}

- (void)_setThumbnailImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._thumbnailImageData, a3);
  [(CNMutableContact *)self updateImageDataAvailableFromCurrentState];

  [(CNMutableContact *)self resetIsUsingSharedPhoto];
}

- (void)updateImageDataAvailableFromCurrentState
{
  if ([(CNContact *)self isKeyAvailable:@"imageDataAvailable"])
  {
    v3 = [(id)objc_opt_class() imageDataDescriptions];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __60__CNMutableContact_updateImageDataAvailableFromCurrentState__block_invoke;
    v4[3] = &unk_1E56B3E68;
    v4[4] = self;
    -[CNMutableContact setImageDataAvailable:](self, "setImageDataAvailable:", objc_msgSend(v3, "_cn_any:", v4));
  }
}

- (void)setImageDataAvailable:(BOOL)a3
{
  self->super._imageDataAvailable = a3;
}

+ (id)imageDataDescriptions
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = +[CN imageDataDescription];
  [v2 addObject:v3];

  v4 = +[CN fullscreenImageDataDescription];
  [v2 addObject:v4];

  id v5 = +[CN thumbnailImageDataDescription];
  [v2 addObject:v5];

  BOOL v6 = +[CN externalImageURIDescription];
  [v2 addObject:v6];

  return v2;
}

- (NSString)givenName
{
  v3 = self->super._givenName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"givenName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"givenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)familyName
{
  v3 = self->super._familyName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"familyName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"familyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSArray)emailAddresses
{
  v3 = self->super._emailAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"emailAddresses"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"emailAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)middleName
{
  v3 = self->super._middleName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"middleName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"middleName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (void)setPreferredForImage:(BOOL)a3
{
  if (self->super._preferredForImage
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredForImage"])
  {
    self->super._preferredForImage = a3;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setNickname:(NSString *)nickname
{
  id v8 = nickname;
  if (self->super._nickname
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nickname"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"nickname"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setNickname:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setNickname:(id)a3
{
}

- (void)setNameSuffix:(NSString *)nameSuffix
{
  id v8 = nameSuffix;
  if (self->super._nameSuffix
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nameSuffix"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"nameSuffix"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setNameSuffix:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setNameSuffix:(id)a3
{
}

- (void)setNamePrefix:(NSString *)namePrefix
{
  id v8 = namePrefix;
  if (self->super._namePrefix
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"namePrefix"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"namePrefix"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setNamePrefix:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setNamePrefix:(id)a3
{
}

- (void)setMiddleName:(NSString *)middleName
{
  id v8 = middleName;
  if (self->super._middleName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"middleName"])
  {
    v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"middleName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setMiddleName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setMiddleName:(id)a3
{
}

- (NSString)nickname
{
  v3 = self->super._nickname;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nickname"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"nickname"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)nameSuffix
{
  v3 = self->super._nameSuffix;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nameSuffix"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"nameSuffix"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)namePrefix
{
  v3 = self->super._namePrefix;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"namePrefix"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"namePrefix"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phoneticMiddleName
{
  v3 = self->super._phoneticMiddleName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticMiddleName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticMiddleName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phoneticGivenName
{
  v3 = self->super._phoneticGivenName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticGivenName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticGivenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSArray)postalAddresses
{
  v3 = self->super._postalAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"postalAddresses"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"postalAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (void)setStoreInfo:(id)a3
{
  if (self->super._storeInfo != a3)
  {
    self->super._storeInfo = (NSDictionary *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setStoreIdentifier:(id)a3
{
  if (self->super._storeIdentifier != a3)
  {
    self->super._storeIdentifier = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)_setPreferredLikenessSource:(id)a3
{
}

- (void)_setPreferredApplePersonaIdentifier:(id)a3
{
}

- (void)_setImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._imageData, a3);
  [(CNMutableContact *)self updateImageDataAvailableFromCurrentState];

  [(CNMutableContact *)self resetIsUsingSharedPhoto];
}

- (void)_setWatchWallpaperImageData:(id)a3
{
}

- (void)_setWallpaperURI:(id)a3
{
}

- (void)_setWallpaperSyncFailedTime:(id)a3
{
}

- (void)_setWallpaper:(id)a3
{
}

- (void)_setUrlAddresses:(id)a3
{
  v4 = (NSArray *)a3;
  p_urlAddresses = &self->super._urlAddresses;
  if (*p_urlAddresses != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_urlAddresses, v4);
    v4 = obj;
  }
}

- (void)_setTextAlert:(id)a3
{
}

- (void)_setSyncImageData:(id)a3
{
}

- (void)_setSocialProfiles:(id)a3
{
  v4 = (NSArray *)a3;
  p_socialProfiles = &self->super._socialProfiles;
  if (*p_socialProfiles != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_socialProfiles, v4);
    v4 = obj;
  }
}

- (void)_setSensitiveContentConfiguration:(id)a3
{
}

- (void)_setSectionForSortingByGivenName:(id)a3
{
}

- (void)_setSectionForSortingByFamilyName:(id)a3
{
}

- (void)_setPronunciationGivenName:(id)a3
{
}

- (void)_setPronunciationFamilyName:(id)a3
{
}

- (void)_setPreviousFamilyName:(id)a3
{
}

- (void)_setPreferredChannel:(id)a3
{
}

- (void)_setPhoneticOrganizationName:(id)a3
{
}

- (void)_setPhoneticMiddleName:(id)a3
{
}

- (void)_setPhoneticGivenName:(id)a3
{
}

- (void)_setPhoneticFamilyName:(id)a3
{
}

- (void)_setPhonemeData:(id)a3
{
}

- (void)_setNote:(id)a3
{
}

- (void)_setModificationDate:(id)a3
{
}

- (void)_setMemojiMetadata:(id)a3
{
}

- (void)_setMapsData:(id)a3
{
}

- (void)_setJobTitle:(id)a3
{
}

- (void)_setInstantMessageAddresses:(id)a3
{
  v4 = (NSArray *)a3;
  p_instantMessageAddresses = &self->super._instantMessageAddresses;
  if (*p_instantMessageAddresses != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_instantMessageAddresses, v4);
    v4 = obj;
  }
}

- (void)_setImageType:(id)a3
{
}

- (void)_setImageSyncFailedTime:(id)a3
{
}

- (void)_setImageHash:(id)a3
{
}

- (void)_setImageBackgroundColorsData:(id)a3
{
}

- (void)_setFullscreenImageData:(id)a3
{
  objc_storeStrong((id *)&self->super._fullscreenImageData, a3);
  [(CNMutableContact *)self updateImageDataAvailableFromCurrentState];

  [(CNMutableContact *)self resetIsUsingSharedPhoto];
}

- (void)_setExternalUUID:(id)a3
{
}

- (void)_setExternalRepresentation:(id)a3
{
}

- (void)_setExternalModificationTag:(id)a3
{
}

- (void)_setExternalImageURI:(id)a3
{
}

- (void)_setExternalIdentifier:(id)a3
{
}

- (void)_setExplicitDisplayName:(id)a3
{
}

- (void)_setDowntimeWhitelist:(id)a3
{
}

- (void)_setDepartmentName:(id)a3
{
}

- (void)_setDates:(id)a3
{
  v4 = (NSArray *)a3;
  p_dates = &self->super._dates;
  if (*p_dates != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_dates, v4);
    v4 = obj;
  }
}

- (void)_setCreationDate:(id)a3
{
}

- (void)_setContactRelations:(id)a3
{
  v4 = (NSArray *)a3;
  p_contactRelations = &self->super._contactRelations;
  if (*p_contactRelations != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_contactRelations, v4);
    v4 = obj;
  }
}

- (void)_setCallAlert:(id)a3
{
}

- (void)_setCalendarURIs:(id)a3
{
  v4 = (NSArray *)a3;
  p_calendarURIs = &self->super._calendarURIs;
  if (*p_calendarURIs != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_calendarURIs, v4);
    v4 = obj;
  }
}

- (void)_setAddressingGrammarsEncrypted:(id)a3
{
  v4 = (NSArray *)a3;
  p_addressingGrammarsEncrypted = &self->super._addressingGrammarsEncrypted;
  if (*p_addressingGrammarsEncrypted != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_addressingGrammarsEncrypted, v4);
    v4 = obj;
  }
}

- (void)_setAddressingGrammars:(id)a3
{
  v4 = (NSArray *)a3;
  p_addressingGrammars = &self->super._addressingGrammars;
  if (*p_addressingGrammars != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_addressingGrammars, v4);
    v4 = obj;
  }
}

- (NSData)watchWallpaperImageData
{
  v3 = self->super._watchWallpaperImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"watchWallpaperImageData"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"watchWallpaperImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)wallpaperURI
{
  v3 = self->super._wallpaperURI;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperURI"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaperURI"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDate)wallpaperSyncFailedTime
{
  v3 = self->super._wallpaperSyncFailedTime;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperSyncFailedTime"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaperSyncFailedTime"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)urlAddresses
{
  v3 = self->super._urlAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"urlAddresses"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"urlAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (CNActivityAlert)textAlert
{
  v3 = self->super._textAlert;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"textAlert"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"textAlert"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)syncImageData
{
  v3 = self->super._syncImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"syncImageData"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"syncImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)socialProfiles
{
  v3 = self->super._socialProfiles;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"socialProfiles"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"socialProfiles"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (int64_t)sharedPhotoDisplayPreference
{
  int64_t sharedPhotoDisplayPreference = self->super._sharedPhotoDisplayPreference;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sharedPhotoDisplayPreference"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return sharedPhotoDisplayPreference;
}

- (CNSensitiveContentConfiguration)sensitiveContentConfiguration
{
  v3 = self->super._sensitiveContentConfiguration;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sensitiveContentConfiguration"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"sensitiveContentConfiguration"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)sectionForSortingByGivenName
{
  v3 = self->super._sectionForSortingByGivenName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sectionForSortingByGivenName"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"sectionForSortingByGivenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)sectionForSortingByFamilyName
{
  v3 = self->super._sectionForSortingByFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sectionForSortingByFamilyName"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"sectionForSortingByFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)pronunciationGivenName
{
  v3 = self->super._pronunciationGivenName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"pronunciationGivenName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"pronunciationGivenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)pronunciationFamilyName
{
  v3 = self->super._pronunciationFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"pronunciationFamilyName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"pronunciationFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)previousFamilyName
{
  v3 = self->super._previousFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"previousFamilyName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"previousFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)preferredLikenessSource
{
  v3 = self->super._preferredLikenessSource;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredLikenessSource"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"preferredLikenessSource"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)preferredChannel
{
  v3 = self->super._preferredChannel;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredChannel"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"preferredChannel"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)preferredApplePersonaIdentifier
{
  v3 = self->super._preferredApplePersonaIdentifier;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredApplePersonaIdentifier"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"preferredApplePersonaIdentifier"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)phoneticOrganizationName
{
  v3 = self->super._phoneticOrganizationName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticOrganizationName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticOrganizationName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phonemeData
{
  v3 = self->super._phonemeData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phonemeData"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phonemeData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)organizationName
{
  v3 = self->super._organizationName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"organizationName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"organizationName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)note
{
  v3 = self->super._note;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"note"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"note"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSDateComponents)nonGregorianBirthday
{
  v3 = (void *)[(NSDateComponents *)self->super._nonGregorianBirthday copy];
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nonGregorianBirthday"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"nonGregorianBirthday"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return (NSDateComponents *)v3;
}

- (NSDate)modificationDate
{
  v3 = self->super._modificationDate;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"modificationDate"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"modificationDate"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)memojiMetadata
{
  v3 = self->super._memojiMetadata;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"memojiMetadata"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"memojiMetadata"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)mapsData
{
  v3 = self->super._mapsData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"mapsData"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"mapsData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)linkIdentifier
{
  v3 = self->super._linkIdentifier;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"linkIdentifier"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"linkIdentifier"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)jobTitle
{
  v3 = self->super._jobTitle;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"jobTitle"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"jobTitle"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (BOOL)isUsingSharedPhoto
{
  return self->super._isUsingSharedPhoto;
}

- (NSArray)instantMessageAddresses
{
  v3 = self->super._instantMessageAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"instantMessageAddresses"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"instantMessageAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)imageType
{
  v3 = self->super._imageType;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageType"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageType"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDate)imageSyncFailedTime
{
  v3 = self->super._imageSyncFailedTime;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageSyncFailedTime"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageSyncFailedTime"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)imageHash
{
  v3 = self->super._imageHash;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageHash"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageHash"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)imageBackgroundColorsData
{
  v3 = self->super._imageBackgroundColorsData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageBackgroundColorsData"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageBackgroundColorsData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalUUID
{
  v3 = self->super._externalUUID;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalUUID"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalUUID"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)externalRepresentation
{
  v3 = self->super._externalRepresentation;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalRepresentation"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalRepresentation"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalModificationTag
{
  v3 = self->super._externalModificationTag;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalModificationTag"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalModificationTag"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalIdentifier
{
  v3 = self->super._externalIdentifier;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalIdentifier"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalIdentifier"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)explicitDisplayName
{
  v3 = self->super._explicitDisplayName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"explicitDisplayName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"explicitDisplayName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)downtimeWhitelist
{
  v3 = self->super._downtimeWhitelist;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"downtimeWhitelist"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"downtimeWhitelist"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)departmentName
{
  v3 = self->super._departmentName;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"departmentName"])
    {
      v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"departmentName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSArray)dates
{
  v3 = self->super._dates;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"dates"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"dates"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDate)creationDate
{
  v3 = self->super._creationDate;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"creationDate"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"creationDate"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)contactRelations
{
  v3 = self->super._contactRelations;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"contactRelations"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"contactRelations"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (CNActivityAlert)callAlert
{
  v3 = self->super._callAlert;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"callAlert"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"callAlert"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)calendarURIs
{
  v3 = self->super._calendarURIs;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"calendarURIs"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"calendarURIs"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDateComponents)birthday
{
  v3 = (void *)[(NSDateComponents *)self->super._birthday copy];
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"birthday"])
    {
      v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"birthday"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return (NSDateComponents *)v3;
}

- (NSArray)addressingGrammars
{
  v3 = self->super._addressingGrammars;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"addressingGrammars"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"addressingGrammars"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)addressingGrammarsEncrypted
{
  v3 = self->super._addressingGrammarsEncrypted;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"addressingGrammarsEncrypted"])
    {
      v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"addressingGrammarsEncrypted"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRectHash, 0);

  objc_storeStrong((id *)&self->_cropRectID, 0);
}

- (BOOL)preferredForName
{
  BOOL preferredForName = self->super._preferredForName;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredForName"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return preferredForName;
}

BOOL __60__CNMutableContact_updateImageDataAvailableFromCurrentState__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 key];
  if ([v4 isKeyAvailable:v5])
  {
    BOOL v6 = [v3 CNValueForContact:*(void *)(a1 + 32)];
    v7 = [v3 nilValue];
    BOOL v8 = v6 != v7;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (NSData)imageData
{
  id v3 = self->super._imageData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)thumbnailImageData
{
  id v3 = self->super._thumbnailImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"thumbnailImageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"thumbnailImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)fullscreenImageData
{
  id v3 = self->super._fullscreenImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"fullscreenImageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"fullscreenImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalImageURI
{
  id v3 = self->super._externalImageURI;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalImageURI"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalImageURI"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (BOOL)preferredForImage
{
  BOOL preferredForImage = self->super._preferredForImage;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredForImage"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return preferredForImage;
}

- (NSArray)phoneNumbers
{
  id v3 = self->super._phoneNumbers;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneNumbers"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneNumbers"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (void)_setNonGregorianBirthday:(id)a3
{
}

- (void)_setBirthday:(id)a3
{
}

- (CNContactType)contactType
{
  CNContactType contactType = self->super._contactType;
  availableKeyDescriptor = self->super._availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"contactType"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return contactType;
}

- (void)setSharedPhotoDisplayPreference:(int64_t)a3
{
  if (self->super._sharedPhotoDisplayPreference
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sharedPhotoDisplayPreference"])
  {
    self->super._int64_t sharedPhotoDisplayPreference = a3;
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setCropRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(CNContact *)self assertKeyIsAvailable:@"cropRect"];
  self->super._cropRect.origin.CGFloat x = x;
  self->super._cropRect.origin.CGFloat y = y;
  self->super._cropRect.size.CGFloat width = width;
  self->super._cropRect.size.CGFloat height = height;
}

- (CGRect)cropRect
{
  [(CNContact *)self assertKeyIsAvailable:@"cropRect"];
  double x = self->super._cropRect.origin.x;
  double y = self->super._cropRect.origin.y;
  double width = self->super._cropRect.size.width;
  double height = self->super._cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)imageDataAvailable
{
  return self->super._imageDataAvailable;
}

- (CNWallpaper)wallpaper
{
  id v3 = self->super._wallpaper;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaper"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaper"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (void)_setWallpaperMetadata:(id)a3
{
}

- (void)setFlags:(unint64_t)a3
{
  self->super._flags = a3;
}

- (void)setPostalAddresses:(NSArray *)postalAddresses
{
  v4 = postalAddresses;
  id v5 = self->super._postalAddresses;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      BOOL v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"postalAddresses"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setPostalAddresses:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"postalAddresses"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"postalAddresses"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)_setPostalAddresses:(id)a3
{
  v4 = (NSArray *)a3;
  p_postalAddresses = &self->super._postalAddresses;
  if (*p_postalAddresses != v4)
  {
    if (!v4)
    {
      v4 = +[CNLabeledValue emptyEntries];
    }
    obj = v4;
    objc_storeStrong((id *)p_postalAddresses, v4);
    v4 = obj;
  }
}

- (CNMutableContact)initWithContact:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CNMutableContact;
  id v5 = [(CNContact *)&v8 init];
  if (v5 && v4)
  {
    uint64_t v6 = [v4 mutableCopy];

    id v5 = (CNMutableContact *)v6;
  }

  return v5;
}

- (id)copyWithSelfAsSnapshot
{
  v2 = (void *)[(CNMutableContact *)self copy];
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  id v4 = (void *)v2[67];
  v2[67] = v3;

  return v2;
}

- (void)setFrozenSelfAsSnapshot
{
  id v3 = (id)[(CNMutableContact *)self copy];
  [(CNMutableContact *)self setSnapshot:v3];
}

+ (id)unifyContacts:(id)a3
{
  return +[CN mutableContactUnifyingContacts:a3 includingMainStoreContacts:1];
}

- (void)setPreviousFamilyName:(NSString *)previousFamilyName
{
  objc_super v8 = previousFamilyName;
  if (self->super._previousFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"previousFamilyName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"previousFamilyName"];
    [v5 assertValueType:v8];

    uint64_t v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setPreviousFamilyName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPhoneticGivenName:(NSString *)phoneticGivenName
{
  objc_super v8 = phoneticGivenName;
  if (self->super._phoneticGivenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticGivenName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"phoneticGivenName"];
    [v5 assertValueType:v8];

    uint64_t v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setPhoneticGivenName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPhoneticMiddleName:(NSString *)phoneticMiddleName
{
  objc_super v8 = phoneticMiddleName;
  if (self->super._phoneticMiddleName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticMiddleName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"phoneticMiddleName"];
    [v5 assertValueType:v8];

    uint64_t v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setPhoneticMiddleName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPhoneticFamilyName:(NSString *)phoneticFamilyName
{
  objc_super v8 = phoneticFamilyName;
  if (self->super._phoneticFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticFamilyName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"phoneticFamilyName"];
    [v5 assertValueType:v8];

    uint64_t v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setPhoneticFamilyName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPhoneticOrganizationName:(NSString *)phoneticOrganizationName
{
  objc_super v8 = phoneticOrganizationName;
  if (self->super._phoneticOrganizationName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticOrganizationName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"phoneticOrganizationName"];
    [v5 assertValueType:v8];

    uint64_t v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setPhoneticOrganizationName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (NSString)searchIndex
{
  id v3 = self->super._searchIndex;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"searchIndex"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  id v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"searchIndex"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (void)setSearchIndex:(id)a3
{
  id v8 = a3;
  if (self->super._searchIndex
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"searchIndex"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"searchIndex"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setSearchIndex:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)_setSearchIndex:(id)a3
{
}

- (void)setPronunciationGivenName:(id)a3
{
  id v8 = a3;
  if (self->super._pronunciationGivenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"pronunciationGivenName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"pronunciationGivenName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setPronunciationGivenName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPronunciationFamilyName:(id)a3
{
  id v8 = a3;
  if (self->super._pronunciationFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"pronunciationFamilyName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"pronunciationFamilyName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setPronunciationFamilyName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setExplicitDisplayName:(id)a3
{
  id v8 = a3;
  if (self->super._explicitDisplayName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"explicitDisplayName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"explicitDisplayName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setExplicitDisplayName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setSectionForSortingByFamilyName:(id)a3
{
  id v8 = a3;
  if (self->super._sectionForSortingByFamilyName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sectionForSortingByFamilyName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"sectionForSortingByFamilyName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setSectionForSortingByFamilyName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setSectionForSortingByGivenName:(id)a3
{
  id v8 = a3;
  if (self->super._sectionForSortingByGivenName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sectionForSortingByGivenName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"sectionForSortingByGivenName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setSectionForSortingByGivenName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setDepartmentName:(NSString *)departmentName
{
  id v8 = departmentName;
  if (self->super._departmentName
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"departmentName"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"departmentName"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setDepartmentName:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setJobTitle:(NSString *)jobTitle
{
  id v8 = jobTitle;
  if (self->super._jobTitle
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"jobTitle"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"jobTitle"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setJobTitle:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setBirthday:(NSDateComponents *)birthday
{
  id v8 = birthday;
  if (self->super._birthday
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"birthday"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"birthday"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSDateComponents *)v8 copy];
    [(CNMutableContact *)self _setBirthday:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setNonGregorianBirthday:(NSDateComponents *)nonGregorianBirthday
{
  id v8 = nonGregorianBirthday;
  if (self->super._nonGregorianBirthday
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nonGregorianBirthday"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"nonGregorianBirthday"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSDateComponents *)v8 copy];
    [(CNMutableContact *)self _setNonGregorianBirthday:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setCreationDate:(id)a3
{
  id v8 = a3;
  if (self->super._creationDate
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"creationDate"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"creationDate"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setCreationDate:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setModificationDate:(id)a3
{
  id v8 = a3;
  if (self->super._modificationDate
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"modificationDate"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"modificationDate"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setModificationDate:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setNote:(NSString *)note
{
  id v8 = note;
  if (self->super._note
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"note"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"note"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSString *)v8 copy];
    [(CNMutableContact *)self _setNote:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setImageData:(NSData *)imageData
{
  id v8 = imageData;
  if (self->super._imageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"imageData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[(NSData *)v8 copy];
    [(CNMutableContact *)self _setImageData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setFullscreenImageData:(id)a3
{
  id v8 = a3;
  if (self->super._fullscreenImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"fullscreenImageData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"fullscreenImageData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setFullscreenImageData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setSyncImageData:(id)a3
{
  id v8 = a3;
  if (self->super._syncImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"syncImageData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"syncImageData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setSyncImageData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (NSString)cardDAVUID
{
  v2 = (void *)[(NSString *)self->super._cardDAVUID copy];

  return (NSString *)v2;
}

- (void)setCardDAVUID:(id)a3
{
  if (self->super._cardDAVUID != a3)
  {
    self->super._cardDAVUID = (NSString *)[a3 copy];
    MEMORY[0x1F41817F8]();
  }
}

- (void)setPhonemeData:(id)a3
{
  id v8 = a3;
  if (self->super._phonemeData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phonemeData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"phonemeData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setPhonemeData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setCallAlert:(id)a3
{
  id v8 = a3;
  if (self->super._callAlert
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"callAlert"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"callAlert"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setCallAlert:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setTextAlert:(id)a3
{
  id v8 = a3;
  if (self->super._textAlert
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"textAlert"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"textAlert"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setTextAlert:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setExternalIdentifier:(id)a3
{
  id v8 = a3;
  if (self->super._externalIdentifier
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalIdentifier"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"externalIdentifier"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setExternalIdentifier:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setExternalRepresentation:(id)a3
{
  id v8 = a3;
  if (self->super._externalRepresentation
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalRepresentation"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"externalRepresentation"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setExternalRepresentation:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setExternalModificationTag:(id)a3
{
  id v8 = a3;
  if (self->super._externalModificationTag
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalModificationTag"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"externalModificationTag"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setExternalModificationTag:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setExternalUUID:(id)a3
{
  id v8 = a3;
  if (self->super._externalUUID
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalUUID"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"externalUUID"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setExternalUUID:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setExternalImageURI:(id)a3
{
  id v8 = a3;
  if (self->super._externalImageURI
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalImageURI"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"externalImageURI"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setExternalImageURI:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setMapsData:(id)a3
{
  id v8 = a3;
  if (self->super._mapsData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"mapsData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"mapsData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setMapsData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setImplicitAugmentation:(BOOL)a3
{
  unint64_t v4 = [(CNContact *)self flags] & 0xFFFFFFFFFFFFFFFELL | a3;

  [(CNMutableContact *)self setFlags:v4];
}

- (void)setUrlAddresses:(NSArray *)urlAddresses
{
  unint64_t v4 = urlAddresses;
  id v5 = self->super._urlAddresses;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"urlAddresses"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setUrlAddresses:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"urlAddresses"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"urlAddresses"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setDates:(NSArray *)dates
{
  unint64_t v4 = dates;
  id v5 = self->super._dates;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"dates"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setDates:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"dates"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"dates"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setInstantMessageAddresses:(NSArray *)instantMessageAddresses
{
  unint64_t v4 = instantMessageAddresses;
  id v5 = self->super._instantMessageAddresses;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"instantMessageAddresses"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setInstantMessageAddresses:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"instantMessageAddresses"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"instantMessageAddresses"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setContactRelations:(NSArray *)contactRelations
{
  unint64_t v4 = contactRelations;
  id v5 = self->super._contactRelations;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"contactRelations"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setContactRelations:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"contactRelations"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"contactRelations"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setSocialProfiles:(NSArray *)socialProfiles
{
  unint64_t v4 = socialProfiles;
  id v5 = self->super._socialProfiles;
  v13 = v4;
  if (v5)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (v5 != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"socialProfiles"];
      [v9 assertValueType:v13];

      v10 = (void *)[(NSArray *)v13 copy];
      [(CNMutableContact *)self _setSocialProfiles:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = v5;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"socialProfiles"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"socialProfiles"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setCalendarURIs:(id)a3
{
  id v4 = a3;
  calendarURIs = self->super._calendarURIs;
  id v13 = v4;
  if (calendarURIs)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (calendarURIs != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"calendarURIs"];
      [v9 assertValueType:v13];

      v10 = (void *)[v13 copy];
      [(CNMutableContact *)self _setCalendarURIs:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = calendarURIs;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"calendarURIs"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"calendarURIs"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setAddressingGrammars:(id)a3
{
  id v4 = a3;
  addressingGrammars = self->super._addressingGrammars;
  id v13 = v4;
  if (addressingGrammars)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (addressingGrammars != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"addressingGrammars"];
      [v9 assertValueType:v13];

      v10 = (void *)[v13 copy];
      [(CNMutableContact *)self _setAddressingGrammars:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = addressingGrammars;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"addressingGrammars"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"addressingGrammars"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setAddressingGrammarsEncrypted:(id)a3
{
  id v4 = a3;
  addressingGrammarsEncrypted = self->super._addressingGrammarsEncrypted;
  id v13 = v4;
  if (addressingGrammarsEncrypted)
  {
    BOOL v6 = +[CNLabeledValue emptyEntries];
    if (addressingGrammarsEncrypted != v6)
    {
LABEL_3:

LABEL_6:
      id v8 = +[CN contactPropertiesByKey];
      v9 = [v8 objectForKey:@"addressingGrammarsEncrypted"];
      [v9 assertValueType:v13];

      v10 = (void *)[v13 copy];
      [(CNMutableContact *)self _setAddressingGrammarsEncrypted:v10];

      goto LABEL_7;
    }
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor)
    {
      BOOL v6 = addressingGrammarsEncrypted;
      goto LABEL_3;
    }
    BOOL v12 = [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"addressingGrammarsEncrypted"];

    if (v12) {
      goto LABEL_6;
    }
  }
  else
  {
    v7 = self->super._availableKeyDescriptor;
    if (!v7 || [(CNContactKeyVector *)v7 containsKey:@"addressingGrammarsEncrypted"]) {
      goto LABEL_6;
    }
  }
  +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
LABEL_7:
}

- (void)setPreferredLikenessSource:(id)a3
{
  id v8 = a3;
  if (self->super._preferredLikenessSource
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredLikenessSource"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"preferredLikenessSource"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setPreferredLikenessSource:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPreferredApplePersonaIdentifier:(id)a3
{
  id v8 = a3;
  if (self->super._preferredApplePersonaIdentifier
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredApplePersonaIdentifier"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"preferredApplePersonaIdentifier"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setPreferredApplePersonaIdentifier:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setPreferredChannel:(id)a3
{
  id v8 = a3;
  if (self->super._preferredChannel
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredChannel"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"preferredChannel"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setPreferredChannel:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setDowntimeWhitelist:(id)a3
{
  id v8 = a3;
  if (self->super._downtimeWhitelist
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"downtimeWhitelist"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"downtimeWhitelist"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setDowntimeWhitelist:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setImageType:(id)a3
{
  id v8 = a3;
  if (self->super._imageType
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageType"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"imageType"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setImageType:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setImageHash:(id)a3
{
  id v8 = a3;
  if (self->super._imageHash
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageHash"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"imageHash"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setImageHash:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setMemojiMetadata:(id)a3
{
  id v8 = a3;
  if (self->super._memojiMetadata
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"memojiMetadata"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"memojiMetadata"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setMemojiMetadata:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setWallpaper:(id)a3
{
  id v8 = a3;
  if (self->super._wallpaper
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaper"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"wallpaper"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setWallpaper:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (CNWallpaperMetadata)wallpaperMetadata
{
  id v3 = self->super._wallpaperMetadata;
  if (!v3)
  {
    availableKeyDescriptor = self->super._availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperMetadata"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  id v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  id v5 = self->super._availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaperMetadata"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (void)setWallpaperMetadata:(id)a3
{
  id v8 = a3;
  if (self->super._wallpaperMetadata
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperMetadata"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"wallpaperMetadata"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setWallpaperMetadata:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setWatchWallpaperImageData:(id)a3
{
  id v8 = a3;
  if (self->super._watchWallpaperImageData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"watchWallpaperImageData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"watchWallpaperImageData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setWatchWallpaperImageData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setWallpaperURI:(id)a3
{
  id v8 = a3;
  if (self->super._wallpaperURI
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperURI"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"wallpaperURI"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setWallpaperURI:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setImageBackgroundColorsData:(id)a3
{
  id v8 = a3;
  if (self->super._imageBackgroundColorsData
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageBackgroundColorsData"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"imageBackgroundColorsData"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setImageBackgroundColorsData:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setSensitiveContentConfiguration:(id)a3
{
  id v8 = a3;
  if (self->super._sensitiveContentConfiguration
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sensitiveContentConfiguration"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"sensitiveContentConfiguration"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setSensitiveContentConfiguration:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setImageSyncFailedTime:(id)a3
{
  id v8 = a3;
  if (self->super._imageSyncFailedTime
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageSyncFailedTime"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"imageSyncFailedTime"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setImageSyncFailedTime:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setWallpaperSyncFailedTime:(id)a3
{
  id v8 = a3;
  if (self->super._wallpaperSyncFailedTime
    || (availableKeyDescriptor = self->super._availableKeyDescriptor) == 0
    || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperSyncFailedTime"])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKey:@"wallpaperSyncFailedTime"];
    [v5 assertValueType:v8];

    BOOL v6 = (void *)[v8 copy];
    [(CNMutableContact *)self _setWallpaperSyncFailedTime:v6];
  }
  else
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (void)setNilValueForKey:(id)a3
{
  id v4 = a3;
  id v5 = +[CN contactPropertiesByKey];
  BOOL v6 = [v5 objectForKeyedSubscript:v4];

  if (v6)
  {
    v7 = [v6 nilValue];
    [v6 setCNValue:v7 onContact:self];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CNMutableContact;
    [(CNMutableContact *)&v8 setNilValueForKey:v4];
  }
}

- (void)updateStateFromContact:(id)a3
{
  if (a3) {
    -[CNMutableContact overwriteStateFromContact:](self, "overwriteStateFromContact:");
  }
  else {
    [(CNMutableContact *)self resetToNewContact];
  }
}

- (void)resetToNewContact
{
  [(CNMutableContact *)self setSnapshot:0];
  uint64_t v3 = MEMORY[0x1E4F1CBF0];

  [(CNMutableContact *)self setLinkedContacts:v3];
}

- (void)overwriteStateFromContact:(id)a3
{
  id v4 = a3;
  __46__CNMutableContact_overwriteStateFromContact___block_invoke((uint64_t)v4, v4, self);
  id v5 = [v4 snapshot];

  if (v5)
  {
    BOOL v6 = [(CNContact *)self snapshot];
    if (v6)
    {
      v7 = +[CNContact contactWithContact:v6];
    }
    else
    {
      v7 = objc_alloc_init(CNMutableContact);
    }
    objc_super v8 = v7;
    v9 = [v4 snapshot];
    __46__CNMutableContact_overwriteStateFromContact___block_invoke((uint64_t)v9, v9, v8);

    v10 = [(CNMutableContact *)v8 freeze];
    [(CNMutableContact *)self setSnapshot:v10];
  }
  if ([(CNContact *)self isUnified])
  {
    v11 = [(CNContact *)self linkedContacts];
    BOOL v12 = objc_msgSend(v11, "_cn_indexBy:", &__block_literal_global_226);

    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__14;
    v23 = __Block_byref_object_dispose__14;
    id v24 = [MEMORY[0x1E4F1CA48] array];
    id v13 = [v4 linkedContacts];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __46__CNMutableContact_overwriteStateFromContact___block_invoke_227;
    v15[3] = &unk_1E56B5940;
    id v14 = v12;
    id v16 = v14;
    id v17 = &__block_literal_global_54;
    v18 = &v19;
    [v13 enumerateObjectsUsingBlock:v15];

    [(CNMutableContact *)self setLinkedContacts:v20[5]];
    _Block_object_dispose(&v19, 8);
  }
}

void __46__CNMutableContact_overwriteStateFromContact___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = [v5 keyVector];
  v7 = [v4 keyVector];
  objc_super v8 = [v6 keyVectorByAddingKeysFromKeyVector:v7];
  [v5 setAvailableKeyDescriptor:v8];

  v9 = [v4 keyVector];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__CNMutableContact_overwriteStateFromContact___block_invoke_2;
  v12[3] = &unk_1E56B58F8;
  id v13 = v4;
  id v14 = v5;
  id v10 = v5;
  id v11 = v4;
  [v9 enumeratePropertiesUsingBlock:v12];
}

void __46__CNMutableContact_overwriteStateFromContact___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = [v4 CNValueForContact:v3];
  [v4 setCNValue:v5 onContact:*(void *)(a1 + 40)];
}

uint64_t __46__CNMutableContact_overwriteStateFromContact___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

void __46__CNMutableContact_overwriteStateFromContact___block_invoke_227(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  id v5 = [v4 identifier];
  id v8 = [v3 objectForKey:v5];

  if (v8)
  {
    (*(void (**)(void))(a1[5] + 16))();

    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];
  }
  else
  {
    BOOL v6 = *(void **)(*(void *)(a1[6] + 8) + 40);
    v7 = (void *)[v4 mutableCopy];

    [v6 addObject:v7];
  }
}

- (void)removeKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[CNContactKeyVector keyVectorWithKeys:v4];
    __31__CNMutableContact_removeKeys___block_invoke((uint64_t)v5, self, v5);
    if ([(CNContact *)self isUnified])
    {
      BOOL v6 = [(CNContact *)self linkedContacts];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __31__CNMutableContact_removeKeys___block_invoke_3;
      v7[3] = &unk_1E56B59B0;
      id v9 = &__block_literal_global_231;
      id v8 = v5;
      objc_msgSend(v6, "_cn_each:", v7);
    }
  }
}

void __31__CNMutableContact_removeKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  BOOL v6 = [v4 keyVector];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __31__CNMutableContact_removeKeys___block_invoke_2;
  v9[3] = &unk_1E56B5988;
  id v10 = v4;
  id v7 = v4;
  [v5 enumeratePropertiesUsingBlock:v9];
  id v8 = [v6 keyVectorByRemovingKeysFromKeyVector:v5];

  [v7 setAvailableKeyDescriptor:v8];
}

void __31__CNMutableContact_removeKeys___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 nilValue];
  [v3 setCNValue:v4 onContact:*(void *)(a1 + 32)];
}

uint64_t __31__CNMutableContact_removeKeys___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), a2, *(void *)(a1 + 32));
}

- (CNContactKeyVector)availableKeyDescriptor
{
  v2 = (void *)[(CNContactKeyVector *)self->super._availableKeyDescriptor copy];

  return (CNContactKeyVector *)v2;
}

- (NSString)cropRectID
{
  return self->_cropRectID;
}

- (void)setCropRectID:(id)a3
{
}

- (NSData)cropRectHash
{
  return self->_cropRectHash;
}

- (void)setCropRectHash:(id)a3
{
}

- (BOOL)hasChanges
{
  return self->_hasChanges;
}

- (void)updateWithSharedProfile:(id)a3
{
  id v15 = a3;
  id v4 = [v15 imageData];
  [(CNMutableContact *)self setImageData:v4];

  id v5 = [v15 thumbnailImageData];
  [(CNMutableContact *)self setThumbnailImageData:v5];

  [v15 cropRect];
  -[CNMutableContact setCropRect:](self, "setCropRect:");
  [(CNMutableContact *)self setMemojiMetadata:0];
  uint64_t v6 = [v15 imageType];
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"PHOTO";
  }
  [(CNMutableContact *)self setImageType:v8];

  id v9 = [v15 imageData];
  id v10 = objc_msgSend(v9, "_cn_md5Hash");
  [(CNMutableContact *)self setImageHash:v10];

  [(CNMutableContact *)self setFullscreenImageData:0];
  id v11 = [v15 wallpaper];
  LODWORD(v10) = [v11 contentIsSensitive];

  if (v10)
  {
    [(CNMutableContact *)self setWallpaper:0];
    [(CNMutableContact *)self setWatchWallpaperImageData:0];
  }
  else
  {
    BOOL v12 = [v15 wallpaper];
    [(CNMutableContact *)self setWallpaper:v12];

    id v13 = [v15 watchWallpaperImageData];
    [(CNMutableContact *)self setWatchWallpaperImageData:v13];
  }
  id v14 = +[CNSensitiveContentConfiguration configurationWithOverride:0];
  [(CNMutableContact *)self setSensitiveContentConfiguration:v14];
}

- (void)setRelatedNames:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = +[CNContactRelation contactRelationWithName:](CNContactRelation, "contactRelationWithName:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(CNMutableContact *)self setContactRelations:v5];
}

@end