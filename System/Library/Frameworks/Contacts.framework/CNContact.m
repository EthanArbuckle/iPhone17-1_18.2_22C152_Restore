@interface CNContact
+ (BOOL)isContactUTIType:(id)a3;
+ (BOOL)isVCardDataUTIType:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (CNContact)contactWithArchivedData:(id)a3 error:(id *)a4;
+ (CNContact)contactWithContact:(id)a3;
+ (CNContact)contactWithDisplayName:(id)a3 emailOrPhoneNumber:(id)a4;
+ (CNContact)contactWithDisplayName:(id)a3 handleStrings:(id)a4;
+ (CNContact)contactWithIdentifier:(id)a3;
+ (CNContact)contactWithIdentifierOnly:(id)a3;
+ (CNContact)contactWithVCardData:(id)a3 error:(id *)a4;
+ (CNKeyDescriptor)descriptorForAllImageDataKeys;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (NSComparator)comparatorForNameSortOrder:(CNContactSortOrder)sortOrder;
+ (NSPredicate)predicateForContactsInContainerWithIdentifier:(NSString *)containerIdentifier;
+ (NSPredicate)predicateForContactsInGroupWithIdentifier:(NSString *)groupIdentifier;
+ (NSPredicate)predicateForContactsMatchingEmailAddress:(NSString *)emailAddress;
+ (NSPredicate)predicateForContactsMatchingName:(NSString *)name;
+ (NSPredicate)predicateForContactsMatchingPhoneNumber:(CNPhoneNumber *)phoneNumber;
+ (NSPredicate)predicateForContactsWithIdentifiers:(NSArray *)identifiers;
+ (NSString)localizedStringForKey:(NSString *)key;
+ (OS_os_log)os_log;
+ (id)_contactWithContact:(id)a3 createNewInstance:(BOOL)a4 propertyDescriptions:(id)a5;
+ (id)alwaysFetchedKeys;
+ (id)contact;
+ (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4;
+ (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5;
+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4;
+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5;
+ (id)contactFromSuggestion:(id)a3;
+ (id)contactIdentifierFromSuggestionID:(id)a3;
+ (id)contactPropertyKeyFromABPropertyID:(int)a3;
+ (id)contactPropertyKeyFromPublicABPropertyID:(int)a3;
+ (id)descriptorForAllComparatorKeys;
+ (id)descriptorForRequiredKeysForSearchableItem;
+ (id)descriptorWithKeyDescriptors:(id)a3 description:(id)a4;
+ (id)emptyContact;
+ (id)identifierProvider;
+ (id)makeContactAndMergeValuesFromAvailableKeysInContact:(id)a3;
+ (id)makeIdentifierString;
+ (id)newContactWithPropertyKeys:(id)a3 withValuesFromContact:(id)a4;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)predicateForAllContacts;
+ (id)predicateForContactMatchingEKParticipantWithName:(id)a3 emailAddress:(id)a4 URL:(id)a5 predicateDescription:(id)a6;
+ (id)predicateForContactMatchingEmailAddress:(id)a3;
+ (id)predicateForContactMatchingLabeledValueIdentifier:(id)a3;
+ (id)predicateForContactMatchingMapString:(id)a3;
+ (id)predicateForContactMatchingPhoneNumber:(id)a3;
+ (id)predicateForContactMatchingPhoneNumberWithDigits:(id)a3 countryCode:(id)a4;
+ (id)predicateForContactMatchingURLString:(id)a3;
+ (id)predicateForContactsLinkedToContact:(id)a3;
+ (id)predicateForContactsLinkedToContactWithIdentifier:(id)a3;
+ (id)predicateForContactsMatchingEmailAddress:(id)a3 groupIdentifiers:(id)a4 limitToOneResult:(BOOL)a5;
+ (id)predicateForContactsMatchingExternalUUIDs:(id)a3;
+ (id)predicateForContactsMatchingFullTextSearch:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5;
+ (id)predicateForContactsMatchingHandleStrings:(id)a3;
+ (id)predicateForContactsMatchingHandleStrings:(id)a3 inContainersWithIdentifiers:(id)a4;
+ (id)predicateForContactsMatchingInstantMessageAddress:(id)a3;
+ (id)predicateForContactsMatchingName:(id)a3 options:(unint64_t)a4;
+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 prefixHint:(id)a4;
+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 prefixHint:(id)a4 groupIdentifiers:(id)a5 limitToOneResult:(BOOL)a6;
+ (id)predicateForContactsMatchingPostalAddress:(id)a3;
+ (id)predicateForContactsMatchingPreferredChannel:(id)a3 limitOne:(BOOL)a4;
+ (id)predicateForContactsMatchingSmartDialerString:(id)a3;
+ (id)predicateForContactsMatchingSocialProfile:(id)a3;
+ (id)predicateForContactsMatchingString:(id)a3 accountIdentifier:(id)a4 containerIdentifier:(id)a5 groupIdentifier:(id)a6;
+ (id)predicateForContactsMissingBackgroundColors;
+ (id)predicateForContactsWithNonUnifiedIdentifiers:(id)a3;
+ (id)predicateForContactsWithOrganizationName:(id)a3;
+ (id)predicateForContactsWithWallpaperMetadata;
+ (id)predicateForFaultFulfillmentForLegacyIdentifier:(unsigned int)a3 identifier:(id)a4;
+ (id)predicateForLegacyIdentifier:(unsigned int)a3;
+ (id)predicateForMeContact;
+ (id)predicateForPreferredNameInContainersWithIdentifiers:(id)a3 groupsWithIdentifiers:(id)a4;
+ (id)predicateForPreferredNameInRange:(_NSRange)a3;
+ (id)predicateForSuggestionIdentifier:(unint64_t)a3;
+ (id)preferredImageComparator;
+ (id)previewURLForContact:(id)a3;
+ (id)storeInfoFromCoder:(id)a3 storeIdentifier:(id)a4 key:(id)a5;
+ (id)suggestionIDFromContactIdentifier:(id)a3;
+ (id)unifyContacts:(id)a3;
+ (int)abPropertyIDfromContactPropertyKey:(id)a3;
+ (int)publicABPropertyIDFromContactPropertyKey:(id)a3;
+ (void)freezeIfInstancetypeIsImmutable:(id)a3;
+ (void)you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact;
- (BOOL)areAllAvailableKeysEqualToContact:(id)a3 ignoringIdentifiers:(BOOL)a4;
- (BOOL)areAllPropertiesButContactIdentifierEqualToContact:(id)a3;
- (BOOL)areAllPropertiesEqualToContactIgnoringIdentifiers:(id)a3;
- (BOOL)areKeysAvailable:(NSArray *)keyDescriptors;
- (BOOL)hasBeenPersisted;
- (BOOL)hasChanges;
- (BOOL)hasSuggestedProperties;
- (BOOL)imageDataAvailable;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualIgnoringIdentifiers:(id)a3;
- (BOOL)isImplicitAugmentation;
- (BOOL)isKeyAvailable:(NSString *)key;
- (BOOL)isProperty:(id)a3 equalToOtherIgnoreIdentifiers:(id)a4;
- (BOOL)isSuggested;
- (BOOL)isSuggestedMe;
- (BOOL)isUnified;
- (BOOL)isUnifiedWithContactWithIdentifier:(NSString *)contactIdentifier;
- (BOOL)isUnifiedWithContactsWithIdentifiers:(id)a3;
- (BOOL)isUsingSharedPhoto;
- (BOOL)overwritePerson:(void *)a3;
- (BOOL)overwritePerson:(void *)a3 error:(id *)a4;
- (BOOL)overwritePublicABPerson:(void *)a3;
- (BOOL)preferredForImage;
- (BOOL)preferredForName;
- (BOOL)updateNewPublicABPerson:(void *)a3 inAddressBook:(void *)a4;
- (CGRect)cropRect;
- (CNActivityAlert)callAlert;
- (CNActivityAlert)textAlert;
- (CNContact)init;
- (CNContact)initWithCoder:(id)a3;
- (CNContact)initWithIdentifier:(id)a3;
- (CNContact)initWithIdentifier:(id)a3 availableKeyDescriptor:(id)a4;
- (CNContact)initWithIdentifier:(id)a3 persisted:(BOOL)a4;
- (CNContactType)contactType;
- (CNKeyDescriptor)availableKeyDescriptor;
- (CNSensitiveContentConfiguration)sensitiveContentConfiguration;
- (CNWallpaper)wallpaper;
- (NSArray)addressingGrammars;
- (NSArray)addressingGrammarsEncrypted;
- (NSArray)calendarURIs;
- (NSArray)contactRelations;
- (NSArray)dates;
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)linkedContacts;
- (NSArray)mainStoreLinkedContacts;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)relatedNames;
- (NSArray)socialProfiles;
- (NSArray)termsOfAddress;
- (NSArray)urlAddresses;
- (NSArray)writableTypeIdentifiersForItemProvider;
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
- (NSDictionary)activityAlerts;
- (NSDictionary)storeInfo;
- (NSSet)availableKeys;
- (NSString)accountIdentifier;
- (NSString)cardDAVUID;
- (NSString)cropRectID;
- (NSString)departmentName;
- (NSString)description;
- (NSString)downtimeWhitelist;
- (NSString)externalIdentifier;
- (NSString)externalImageURI;
- (NSString)externalModificationTag;
- (NSString)externalUUID;
- (NSString)familyName;
- (NSString)fullName;
- (NSString)givenName;
- (NSString)identifier;
- (NSString)imageType;
- (NSString)internalIdentifier;
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
- (NSString)phoneticFullName;
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
- (NSString)sortingFamilyName;
- (NSString)sortingGivenName;
- (NSString)storeIdentifier;
- (NSString)stringForIndexing;
- (NSString)suggestionFoundInBundleId;
- (NSString)wallpaperURI;
- (NSUUID)id;
- (SGRecordId)suggestionRecordId;
- (id)_filteredArrayForValidValues:(id)a3;
- (id)_searchableItemIncludingInternalAttributes:(BOOL)a3;
- (id)allLinkedIdentifiers;
- (id)areKeysAvailable:(id)a3 useIgnorableKeys:(BOOL)a4 findMissingKeys:(BOOL)a5;
- (id)copyWithCuratingAllSuggestions;
- (id)copyWithDistinctIdentifier;
- (id)copyWithPropertyKeys:(id)a3;
- (id)copyWithSelfAsSnapshot;
- (id)diffToSnapshotAndReturnError:(id *)a3;
- (id)explicitDisplayName;
- (id)keyVector;
- (id)linkedContactsFromStoreWithIdentifier:(id)a3;
- (id)linkedIdentifierMap;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)searchableItemAttributeSetForUserActivity;
- (id)searchableItemForDragging;
- (id)searchableItemForIndexing;
- selfOrMutableCopy;
- (id)shortDebugDescription;
- (id)snapshot;
- (id)wallpaperMetadata;
- (int)iOSLegacyIdentifier;
- (int64_t)displayNameOrder;
- (int64_t)sharedPhotoDisplayPreference;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)assertKeyIsAvailable:(id)a3;
- (void)assertKeysAreAvailable:(id)a3;
- (void)detachedPerson;
- (void)detachedPersonWithError:(id *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContact

+ (CNContact)contactWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithIdentifier:v4];

  return (CNContact *)v5;
}

- (CNContact)initWithIdentifier:(id)a3
{
  id v4 = a3;
  v5 = +[CNContactKeyVector keyVectorWithAllKeys];
  v6 = [(CNContact *)self initWithIdentifier:v4 availableKeyDescriptor:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cropRectHash, 0);
  objc_storeStrong((id *)&self->_cropRectID, 0);
  objc_storeStrong((id *)&self->_wallpaperSyncFailedTime, 0);
  objc_storeStrong((id *)&self->_imageSyncFailedTime, 0);
  objc_storeStrong((id *)&self->_sensitiveContentConfiguration, 0);
  objc_storeStrong((id *)&self->_imageBackgroundColorsData, 0);
  objc_storeStrong((id *)&self->_wallpaperURI, 0);
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaperMetadata, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_downtimeWhitelist, 0);
  objc_storeStrong((id *)&self->_ISOCountryCode, 0);
  objc_storeStrong((id *)&self->_preferredChannel, 0);
  objc_storeStrong((id *)&self->_preferredApplePersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_preferredLikenessSource, 0);
  objc_storeStrong((id *)&self->_searchIndex, 0);
  objc_storeStrong((id *)&self->_mapsData, 0);
  objc_storeStrong((id *)&self->_availableKeyDescriptor, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_linkedContacts, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong((id *)&self->_storeInfo, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_textAlert, 0);
  objc_storeStrong((id *)&self->_callAlert, 0);
  objc_storeStrong((id *)&self->_externalImageURI, 0);
  objc_storeStrong((id *)&self->_externalUUID, 0);
  objc_storeStrong((id *)&self->_externalModificationTag, 0);
  objc_storeStrong((id *)&self->_externalRepresentation, 0);
  objc_storeStrong((id *)&self->_externalIdentifier, 0);
  objc_storeStrong((id *)&self->_cardDAVUID, 0);
  objc_storeStrong((id *)&self->_calendarURIs, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_contactRelations, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_phonemeData, 0);
  objc_storeStrong((id *)&self->_linkIdentifier, 0);
  objc_storeStrong((id *)&self->_syncImageData, 0);
  objc_storeStrong((id *)&self->_fullscreenImageData, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_note, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_sectionForSortingByFamilyName, 0);
  objc_storeStrong((id *)&self->_sectionForSortingByGivenName, 0);
  objc_storeStrong((id *)&self->_sortingFamilyName, 0);
  objc_storeStrong((id *)&self->_sortingGivenName, 0);
  objc_storeStrong((id *)&self->_addressingGrammarsEncrypted, 0);
  objc_storeStrong((id *)&self->_addressingGrammars, 0);
  objc_storeStrong((id *)&self->_explicitDisplayName, 0);
  objc_storeStrong((id *)&self->_pronunciationFamilyName, 0);
  objc_storeStrong((id *)&self->_pronunciationGivenName, 0);
  objc_storeStrong((id *)&self->_phoneticOrganizationName, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyName, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticGivenName, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_previousFamilyName, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);

  objc_storeStrong((id *)&self->_internalIdentifier, 0);
}

- (NSString)linkIdentifier
{
  v3 = self->_linkIdentifier;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"linkIdentifier"])
    {
      v3 = 0;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"linkIdentifier"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (CNContact)initWithIdentifier:(id)a3 availableKeyDescriptor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    if (CNGuardOSLog_cn_once_token_0_6 != -1) {
      dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_835);
    }
    v8 = (void *)CNGuardOSLog_cn_once_object_0_6;
    if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT)) {
      -[CNContact initWithIdentifier:availableKeyDescriptor:](v8);
    }
  }
  v43.receiver = self;
  v43.super_class = (Class)CNContact;
  v9 = [(CNContact *)&v43 init];
  if (v9)
  {
    uint64_t v10 = [v6 copy];
    internalIdentifier = v9->_internalIdentifier;
    v9->_internalIdentifier = (NSString *)v10;

    uint64_t v12 = [v7 copy];
    availableKeyDescriptor = v9->_availableKeyDescriptor;
    v9->_availableKeyDescriptor = (CNContactKeyVector *)v12;

    v9->_displayNameOrder = 0;
    v9->_sharedPhotoDisplayPreference = 0;
    *(_WORD *)&v9->_preferredForName = 1;
    v9->_iOSLegacyIdentifier = -1;
    v14 = +[CNLabeledValue emptyEntries];
    uint64_t v15 = [v14 copy];
    phoneNumbers = v9->_phoneNumbers;
    v9->_phoneNumbers = (NSArray *)v15;

    uint64_t v17 = [v14 copy];
    emailAddresses = v9->_emailAddresses;
    v9->_emailAddresses = (NSArray *)v17;

    uint64_t v19 = [v14 copy];
    urlAddresses = v9->_urlAddresses;
    v9->_urlAddresses = (NSArray *)v19;

    uint64_t v21 = [v14 copy];
    dates = v9->_dates;
    v9->_dates = (NSArray *)v21;

    uint64_t v23 = [v14 copy];
    instantMessageAddresses = v9->_instantMessageAddresses;
    v9->_instantMessageAddresses = (NSArray *)v23;

    uint64_t v25 = [v14 copy];
    contactRelations = v9->_contactRelations;
    v9->_contactRelations = (NSArray *)v25;

    uint64_t v27 = [v14 copy];
    socialProfiles = v9->_socialProfiles;
    v9->_socialProfiles = (NSArray *)v27;

    uint64_t v29 = [v14 copy];
    postalAddresses = v9->_postalAddresses;
    v9->_postalAddresses = (NSArray *)v29;

    uint64_t v31 = [v14 copy];
    calendarURIs = v9->_calendarURIs;
    v9->_calendarURIs = (NSArray *)v31;

    uint64_t v33 = [v14 copy];
    addressingGrammars = v9->_addressingGrammars;
    v9->_addressingGrammars = (NSArray *)v33;

    uint64_t v35 = [v14 copy];
    addressingGrammarsEncrypted = v9->_addressingGrammarsEncrypted;
    v9->_addressingGrammarsEncrypted = (NSArray *)v35;

    v37 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    linkedContacts = v9->_linkedContacts;
    v9->_linkedContacts = v37;

    if ([v7 containsKey:@"creationDate"])
    {
      uint64_t v39 = [MEMORY[0x1E4F1C9C8] date];
      creationDate = v9->_creationDate;
      v9->_creationDate = (NSDate *)v39;
    }
    v41 = v9;
  }
  return v9;
}

- (id)keyVector
{
  return self->_availableKeyDescriptor;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __17__CNContact_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __17__CNContact_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[CNContact contactWithContact:self];
  snapshot = self->_snapshot;
  id v6 = [MEMORY[0x1E4F1CA98] null];

  if (snapshot == v6) {
    [v4 setSnapshot:self];
  }
  return v4;
}

+ (CNContact)contactWithContact:(id)a3
{
  id v4 = a3;
  v5 = +[CN allContactProperties];
  id v6 = [a1 _contactWithContact:v4 createNewInstance:0 propertyDescriptions:v5];

  return (CNContact *)v6;
}

uint64_t __21__CNContact_isEqual___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) identifier];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) identifier];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) identifier];
  v5 = [*(id *)(a1 + 40) identifier];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

uint64_t __17__CNContact_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) internalIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __17__CNContact_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) storeIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (NSString)identifier
{
  uint64_t v3 = [(CNContact *)self internalIdentifier];
  id v4 = [(CNContact *)self storeIdentifier];
  if (v4)
  {
    v5 = +[CNContactStore storeClassWithIdentifier:v4];
    if (v5)
    {
      uint64_t v6 = v5;
      if (objc_opt_respondsToSelector())
      {
        uint64_t v7 = [(objc_class *)v6 contactIdentifierFromInternalIdentifier:v3];

        uint64_t v3 = (void *)v7;
      }
    }
  }

  return (NSString *)v3;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)internalIdentifier
{
  return self->_internalIdentifier;
}

- (NSString)givenName
{
  uint64_t v3 = self->_givenName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"givenName"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"givenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)middleName
{
  uint64_t v3 = self->_middleName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"middleName"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"middleName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)familyName
{
  uint64_t v3 = self->_familyName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"familyName"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"familyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)nameSuffix
{
  uint64_t v3 = self->_nameSuffix;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nameSuffix"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"nameSuffix"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)namePrefix
{
  uint64_t v3 = self->_namePrefix;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"namePrefix"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"namePrefix"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)nickname
{
  uint64_t v3 = self->_nickname;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nickname"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"nickname"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phoneticMiddleName
{
  uint64_t v3 = self->_phoneticMiddleName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticMiddleName"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticMiddleName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phoneticGivenName
{
  uint64_t v3 = self->_phoneticGivenName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticGivenName"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticGivenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phoneticFamilyName
{
  uint64_t v3 = self->_phoneticFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticFamilyName"])
    {
      uint64_t v3 = &stru_1EE052B80;
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
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    id v4 = v3;
    uint64_t v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

void __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v9 = v3;
  if (*(unsigned char *)(a1 + 48)
    || (id v4 = *(void **)(a1 + 32),
        [v3 key],
        v5 = objc_claimAutoreleasedReturnValue(),
        LODWORD(v4) = [v4 isKeyAvailable:v5],
        v5,
        BOOL v6 = v9,
        v4))
  {
    uint64_t v7 = *(void **)(a1 + 40);
    v8 = [v9 key];
    [v7 addKey:v8];

    BOOL v6 = v9;
  }
}

+ (id)_contactWithContact:(id)a3 createNewInstance:(BOOL)a4 propertyDescriptions:(id)a5
{
  BOOL v6 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v8) {
    goto LABEL_5;
  }
  if (CNGuardOSLog_cn_once_token_0_6 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_835);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT))
  {
    +[CNContact _contactWithContact:createNewInstance:propertyDescriptions:]();
    if (v9) {
      goto LABEL_10;
    }
  }
  else
  {
LABEL_5:
    if (v9) {
      goto LABEL_10;
    }
  }
  if (CNGuardOSLog_cn_once_token_0_6 != -1) {
    dispatch_once(&CNGuardOSLog_cn_once_token_0_6, &__block_literal_global_835);
  }
  if (os_log_type_enabled((os_log_t)CNGuardOSLog_cn_once_object_0_6, OS_LOG_TYPE_FAULT)) {
    +[CNContact _contactWithContact:createNewInstance:propertyDescriptions:]();
  }
LABEL_10:
  id v42 = a1;
  if (v6) {
    [a1 makeIdentifier];
  }
  else {
  uint64_t v10 = [v8 internalIdentifier];
  }
  v11 = objc_alloc_init(CNMutableContactKeyVector);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke;
  v51[3] = &unk_1E56B7EA0;
  BOOL v54 = v6;
  uint64_t v12 = (id *)v8;
  v52 = v12;
  v13 = v11;
  v53 = v13;
  [v9 enumerateObjectsUsingBlock:v51];
  v40 = v13;
  v41 = (void *)v10;
  v14 = [(CNContact *)[CNMutableContact alloc] initWithIdentifier:v10 availableKeyDescriptor:v13];
  uint64_t v15 = +[CN alwaysFetchedProperties];
  v16 = [v9 arrayByAddingObjectsFromArray:v15];

  uint64_t v17 = +[CN runtimeOnlyProperties];
  v18 = [v16 arrayByAddingObjectsFromArray:v17];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v19 = v18;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v48 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        uint64_t v25 = [v24 key];
        int v26 = [v12 isKeyAvailable:v25];

        if (v26)
        {
          uint64_t v27 = [v24 CNValueForContact:v12];
          if (v6)
          {
            uint64_t v28 = [v24 valueWithResetIdentifiers:v27];

            uint64_t v27 = (void *)v28;
          }
        }
        else
        {
          if (!v6) {
            continue;
          }
          uint64_t v27 = [v24 nilValue];
        }
        [v24 setCNValue:v27 onContact:v14];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v21);
  }

  uint64_t v29 = [v12[67] copy];
  snapshot = v14->super._snapshot;
  v14->super._snapshot = (CNContact *)v29;

  if ([v12 isUnified])
  {
    uint64_t v31 = [v12 linkedContacts];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke_2;
    v43[3] = &unk_1E56B7EC8;
    id v45 = v42;
    BOOL v46 = v6;
    id v44 = v19;
    v32 = objc_msgSend(v31, "_cn_map:", v43);

    [(CNMutableContact *)v14 setLinkedContacts:v32];
  }
  uint64_t v33 = [v12[69] copy];
  accountIdentifier = v14->super._accountIdentifier;
  v14->super._accountIdentifier = (NSString *)v33;

  if (!v6)
  {
    uint64_t v35 = [v12 storeIdentifier];
    [(CNMutableContact *)v14 setStoreIdentifier:v35];

    v36 = [v12 storeInfo];
    [(CNMutableContact *)v14 setStoreInfo:v36];
  }
  if ([v42 isSubclassOfClass:objc_opt_class()])
  {
    v37 = v14;
  }
  else
  {
    v37 = [(CNMutableContact *)v14 freeze];
  }
  v38 = v37;

  return v38;
}

- (BOOL)isUnified
{
  if (![(CNContact *)self isKeyAvailable:@"linkIdentifier"]) {
    return 0;
  }
  id v3 = [(CNContact *)self linkedContacts];
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (BOOL)isKeyAvailable:(NSString *)key
{
  return [(CNContactKeyVector *)self->_availableKeyDescriptor containsKey:key];
}

- (NSArray)linkedContacts
{
  return self->_linkedContacts;
}

- (int)iOSLegacyIdentifier
{
  return self->_iOSLegacyIdentifier;
}

- (NSArray)emailAddresses
{
  id v3 = self->_emailAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"emailAddresses"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"emailAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (void)assertKeyIsAvailable:(id)a3
{
  if (![(CNContact *)self isKeyAvailable:a3])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
}

- (NSData)thumbnailImageData
{
  id v3 = self->_thumbnailImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"thumbnailImageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"thumbnailImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (BOOL)areKeysAvailable:(NSArray *)keyDescriptors
{
  id v3 = [(CNContact *)self areKeysAvailable:keyDescriptors useIgnorableKeys:1 findMissingKeys:0];
  BOOL v4 = [v3 first];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)areKeysAvailable:(id)a3 useIgnorableKeys:(BOOL)a4 findMissingKeys:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v34 = self;
  id v29 = v7;
  if (self->_availableKeyDescriptor)
  {
    id v8 = v7;
    BOOL v35 = v5;
    if (v5) {
      uint64_t v33 = objc_alloc_init(CNMutableContactKeyVector);
    }
    else {
      uint64_t v33 = 0;
    }
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id obj = v8;
    uint64_t v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v50, 16, v29);
    if (v10)
    {
      uint64_t v11 = *(void *)v47;
      char v12 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v47 != v11) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (_CNIsObject_CNKeyDescriptorPrivate(v14))
          {
            if (a4) {
              objc_msgSend(v14, "_cn_ignorableKeys");
            }
            else {
            uint64_t v15 = +[CNContactKeyVector keyVector];
            }
            v16 = objc_msgSend(v14, "_cn_requiredKeys");
            uint64_t v17 = [v16 keyVectorByRemovingKeysFromKeyVector:v15];

            if (([v17 isSubsetOfKeyVector:v34->_availableKeyDescriptor] & 1) == 0)
            {
              if (!v35)
              {

                char v12 = 0;
                v24 = 0;
                goto LABEL_34;
              }
              [(CNMutableContactKeyVector *)v33 unionKeyVector:v17];
              [(CNMutableContactKeyVector *)v33 minusKeyVector:v34->_availableKeyDescriptor];
              char v12 = 0;
            }
            v18 = objc_msgSend(v14, "_cn_optionalKeys");
            id v19 = +[CNContactKeyVector keyVector];
            char v20 = [v18 isEqualToKeyVector:v19];

            if ((v20 & 1) == 0)
            {
              uint64_t v42 = 0;
              objc_super v43 = &v42;
              uint64_t v44 = 0x2020000000;
              char v45 = 0;
              v38[0] = MEMORY[0x1E4F143A8];
              v38[1] = 3221225472;
              v38[2] = __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke;
              v38[3] = &unk_1E56B7FA0;
              v38[4] = v34;
              id v21 = v15;
              id v39 = v21;
              v41 = &v42;
              v40 = v33;
              objc_msgSend(v14, "_cn_executeGetterForRepresentedKeys:", v38);
              BOOL v22 = *((unsigned char *)v43 + 24) == 0;
              BOOL v23 = !*((unsigned char *)v43 + 24) || v35;

              v12 &= v22;
              _Block_object_dispose(&v42, 8);
              if (!v23)
              {

                goto LABEL_32;
              }
            }
          }
          else
          {
            char v12 = 0;
            if (!v35)
            {
              v24 = 0;
              goto LABEL_35;
            }
          }
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v46 objects:v50 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    else
    {
      char v12 = 1;
    }
LABEL_32:

    if (v35)
    {
      uint64_t v25 = [MEMORY[0x1E4F1CA80] set];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke_2;
      v36[3] = &unk_1E56B5988;
      v37 = v25;
      id obj = v25;
      [(CNContactKeyVector *)v33 enumeratePropertiesUsingBlock:v36];
      v24 = [obj allObjects];
      uint64_t v15 = v37;
LABEL_34:

LABEL_35:
    }
    else
    {
      v24 = 0;
    }
    int v26 = (void *)MEMORY[0x1E4F5A490];
    uint64_t v27 = [NSNumber numberWithBool:v12 & 1];
    id v9 = [v26 pairWithFirst:v27 second:v24];
  }
  else
  {
    id v9 = objc_msgSend(MEMORY[0x1E4F5A490], "pairWithFirst:second:", MEMORY[0x1E4F1CC38], 0, v7);
  }

  return v9;
}

- (NSArray)phoneNumbers
{
  id v3 = self->_phoneNumbers;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneNumbers"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneNumbers"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)preferredLikenessSource
{
  id v3 = self->_preferredLikenessSource;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredLikenessSource"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"preferredLikenessSource"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)preferredApplePersonaIdentifier
{
  id v3 = self->_preferredApplePersonaIdentifier;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredApplePersonaIdentifier"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"preferredApplePersonaIdentifier"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (int64_t)sharedPhotoDisplayPreference
{
  int64_t sharedPhotoDisplayPreference = self->_sharedPhotoDisplayPreference;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sharedPhotoDisplayPreference"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return sharedPhotoDisplayPreference;
}

- (BOOL)isUsingSharedPhoto
{
  BOOL isUsingSharedPhoto = self->_isUsingSharedPhoto;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"isUsingSharedPhoto"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return isUsingSharedPhoto;
}

- (NSString)organizationName
{
  id v3 = self->_organizationName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"organizationName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"organizationName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSDictionary)storeInfo
{
  return self->_storeInfo;
}

- (NSData)imageData
{
  id v3 = self->_imageData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)postalAddresses
{
  id v3 = self->_postalAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"postalAddresses"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"postalAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)watchWallpaperImageData
{
  id v3 = self->_watchWallpaperImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"watchWallpaperImageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"watchWallpaperImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)wallpaperURI
{
  id v3 = self->_wallpaperURI;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperURI"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaperURI"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDate)wallpaperSyncFailedTime
{
  id v3 = self->_wallpaperSyncFailedTime;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperSyncFailedTime"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaperSyncFailedTime"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)urlAddresses
{
  id v3 = self->_urlAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"urlAddresses"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"urlAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (CNActivityAlert)textAlert
{
  id v3 = self->_textAlert;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"textAlert"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"textAlert"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)syncImageData
{
  id v3 = self->_syncImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"syncImageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"syncImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)socialProfiles
{
  id v3 = self->_socialProfiles;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"socialProfiles"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"socialProfiles"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (CNSensitiveContentConfiguration)sensitiveContentConfiguration
{
  id v3 = self->_sensitiveContentConfiguration;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sensitiveContentConfiguration"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"sensitiveContentConfiguration"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)sectionForSortingByGivenName
{
  id v3 = self->_sectionForSortingByGivenName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sectionForSortingByGivenName"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"sectionForSortingByGivenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)sectionForSortingByFamilyName
{
  id v3 = self->_sectionForSortingByFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"sectionForSortingByFamilyName"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"sectionForSortingByFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)pronunciationGivenName
{
  id v3 = self->_pronunciationGivenName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"pronunciationGivenName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"pronunciationGivenName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)pronunciationFamilyName
{
  id v3 = self->_pronunciationFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"pronunciationFamilyName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"pronunciationFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)previousFamilyName
{
  id v3 = self->_previousFamilyName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"previousFamilyName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"previousFamilyName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)preferredChannel
{
  return self->_preferredChannel;
}

- (NSString)phoneticOrganizationName
{
  id v3 = self->_phoneticOrganizationName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phoneticOrganizationName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phoneticOrganizationName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSString)phonemeData
{
  id v3 = self->_phonemeData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"phonemeData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"phonemeData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)note
{
  id v3 = self->_note;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"note"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"note"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSDateComponents)nonGregorianBirthday
{
  id v3 = (void *)[(NSDateComponents *)self->_nonGregorianBirthday copy];
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"nonGregorianBirthday"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"nonGregorianBirthday"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return (NSDateComponents *)v3;
}

- (NSDate)modificationDate
{
  id v3 = self->_modificationDate;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"modificationDate"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"modificationDate"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)memojiMetadata
{
  id v3 = self->_memojiMetadata;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"memojiMetadata"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"memojiMetadata"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)mapsData
{
  id v3 = self->_mapsData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"mapsData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"mapsData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)jobTitle
{
  id v3 = self->_jobTitle;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"jobTitle"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"jobTitle"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSArray)instantMessageAddresses
{
  id v3 = self->_instantMessageAddresses;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"instantMessageAddresses"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"instantMessageAddresses"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)imageType
{
  id v3 = self->_imageType;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageType"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageType"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDate)imageSyncFailedTime
{
  id v3 = self->_imageSyncFailedTime;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageSyncFailedTime"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageSyncFailedTime"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)imageHash
{
  id v3 = self->_imageHash;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageHash"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageHash"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)imageBackgroundColorsData
{
  id v3 = self->_imageBackgroundColorsData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"imageBackgroundColorsData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"imageBackgroundColorsData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)fullscreenImageData
{
  id v3 = self->_fullscreenImageData;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"fullscreenImageData"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"fullscreenImageData"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalUUID
{
  id v3 = self->_externalUUID;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalUUID"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalUUID"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSData)externalRepresentation
{
  id v3 = self->_externalRepresentation;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalRepresentation"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalRepresentation"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalModificationTag
{
  id v3 = self->_externalModificationTag;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalModificationTag"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalModificationTag"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalImageURI
{
  id v3 = self->_externalImageURI;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalImageURI"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalImageURI"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)externalIdentifier
{
  id v3 = self->_externalIdentifier;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"externalIdentifier"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"externalIdentifier"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (id)explicitDisplayName
{
  id v3 = self->_explicitDisplayName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"explicitDisplayName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"explicitDisplayName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)downtimeWhitelist
{
  id v3 = self->_downtimeWhitelist;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"downtimeWhitelist"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"downtimeWhitelist"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)departmentName
{
  id v3 = self->_departmentName;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"departmentName"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"departmentName"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (NSArray)dates
{
  id v3 = self->_dates;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"dates"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"dates"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDate)creationDate
{
  id v3 = self->_creationDate;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"creationDate"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"creationDate"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)contactRelations
{
  id v3 = self->_contactRelations;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"contactRelations"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"contactRelations"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (CNActivityAlert)callAlert
{
  id v3 = self->_callAlert;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"callAlert"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"callAlert"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)calendarURIs
{
  id v3 = self->_calendarURIs;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"calendarURIs"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"calendarURIs"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSDateComponents)birthday
{
  id v3 = (void *)[(NSDateComponents *)self->_birthday copy];
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"birthday"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"birthday"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return (NSDateComponents *)v3;
}

- (NSArray)addressingGrammars
{
  id v3 = self->_addressingGrammars;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"addressingGrammars"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"addressingGrammars"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSArray)addressingGrammarsEncrypted
{
  id v3 = self->_addressingGrammarsEncrypted;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"addressingGrammarsEncrypted"])
    {
      id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  BOOL v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    BOOL v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"addressingGrammarsEncrypted"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    BOOL v4 = v3;
    id v3 = (NSArray *)MEMORY[0x1E4F1CBF0];
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (BOOL)preferredForName
{
  BOOL preferredForName = self->_preferredForName;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredForName"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return preferredForName;
}

+ (id)alwaysFetchedKeys
{
  if (alwaysFetchedKeys_cn_once_token_1 != -1) {
    dispatch_once(&alwaysFetchedKeys_cn_once_token_1, &__block_literal_global_4_9);
  }
  v2 = (void *)alwaysFetchedKeys_cn_once_object_1;

  return v2;
}

+ (id)predicateForAllContacts
{
  if (predicateForAllContacts_cn_once_token_0 != -1) {
    dispatch_once(&predicateForAllContacts_cn_once_token_0, &__block_literal_global_41);
  }
  v2 = (void *)predicateForAllContacts_cn_once_object_0;

  return v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __21__CNContact_isEqual___block_invoke;
  v24[3] = &unk_1E56B3E18;
  v24[4] = self;
  id v25 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNContact_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v7 = v25;
  id v23 = v7;
  id v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __21__CNContact_isEqual___block_invoke_3;
  v20[3] = &unk_1E56B3E18;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  uint64_t v10 = _Block_copy(v20);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  v16 = __21__CNContact_isEqual___block_invoke_4;
  uint64_t v17 = &unk_1E56B3E18;
  v18 = self;
  id v19 = v9;
  id v11 = v9;
  char v12 = _Block_copy(&v14);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v11, v6, self, v24, v8, v10, v12, 0, v14, v15, v16, v17, v18);

  return (char)self;
}

uint64_t __30__CNContact_alwaysFetchedKeys__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 key];
}

- (BOOL)preferredForImage
{
  BOOL preferredForImage = self->_preferredForImage;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"preferredForImage"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return preferredForImage;
}

+ (NSPredicate)predicateForContactsMatchingPhoneNumber:(CNPhoneNumber *)phoneNumber
{
  id v3 = phoneNumber;
  id v4 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v3, 1);

  return (NSPredicate *)v4;
}

- (CNContact)init
{
  id v3 = [(id)objc_opt_class() makeIdentifier];
  id v4 = [(CNContact *)self initWithIdentifier:v3];

  return v4;
}

+ (id)makeIdentifierString
{
  v2 = [a1 identifierProvider];
  id v3 = [v2 makeIdentifier];

  return v3;
}

+ (id)identifierProvider
{
  if (identifierProvider_cn_once_token_2 != -1) {
    dispatch_once(&identifierProvider_cn_once_token_2, &__block_literal_global_229);
  }
  v2 = (void *)identifierProvider_cn_once_object_2;

  return v2;
}

+ (NSPredicate)predicateForContactsMatchingEmailAddress:(NSString *)emailAddress
{
  id v3 = emailAddress;
  id v4 = [(CNEmailAddressContactPredicate *)[CNiOSABEmailAddressContactPredicate alloc] initWithEmailAddress:v3 returnMultipleResults:1];

  return (NSPredicate *)v4;
}

void __56__CNContact_Predicates_Private__predicateForAllContacts__block_invoke()
{
  v2 = objc_alloc_init(CNiOSABAllContactsPredicate);
  uint64_t v0 = [(CNiOSABAllContactsPredicate *)v2 copy];
  v1 = (void *)predicateForAllContacts_cn_once_object_0;
  predicateForAllContacts_cn_once_object_0 = v0;
}

- (BOOL)hasBeenPersisted
{
  return self->_snapshot != 0;
}

+ (NSPredicate)predicateForContactsWithIdentifiers:(NSArray *)identifiers
{
  id v3 = identifiers;
  id v4 = [(CNContactsWithIdentifiersPredicate *)[CNiOSABContactIdentifiersPredicate alloc] initWithIdentifiers:v3];

  return (NSPredicate *)v4;
}

- (id)snapshot
{
  v2 = self;
  snapshot = self->_snapshot;
  id v4 = [MEMORY[0x1E4F1CA98] null];
  if (snapshot != v4) {
    v2 = v2->_snapshot;
  }
  BOOL v5 = v2;

  return v5;
}

- (unint64_t)flags
{
  return self->_flags;
}

+ (id)descriptorWithKeyDescriptors:(id)a3 description:(id)a4
{
  return +[CNAggregateKeyDescriptor keyDescriptorWithKeyDescriptors:a3 description:a4];
}

- (CNContactType)contactType
{
  CNContactType contactType = self->_contactType;
  availableKeyDescriptor = self->_availableKeyDescriptor;
  if (availableKeyDescriptor
    && ![(CNContactKeyVector *)availableKeyDescriptor containsKey:@"contactType"])
  {
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
  }
  return contactType;
}

- (CGRect)cropRect
{
  [(CNContact *)self assertKeyIsAvailable:@"cropRect"];
  double x = self->_cropRect.origin.x;
  double y = self->_cropRect.origin.y;
  double width = self->_cropRect.size.width;
  double height = self->_cropRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)imageDataAvailable
{
  return self->_imageDataAvailable;
}

+ (id)predicateForContactsMatchingHandleStrings:(id)a3
{
  id v3 = a3;
  id v4 = [(CNHandleStringsContactPredicate *)[CNiOSABHandleStringsContactPredicate alloc] initWithHandleStrings:v3 containerIdentifiers:0];

  return v4;
}

+ (id)predicateForPreferredNameInRange:(_NSRange)a3
{
  id v3 = -[CNiOSABPreferredNameContactsPredicate initWithRange:]([CNiOSABPreferredNameContactsPredicate alloc], "initWithRange:", a3.location, a3.length);

  return v3;
}

+ (id)predicateForMeContact
{
  v2 = objc_alloc_init(CNiOSABMeContactsPredicate);

  return v2;
}

- (CNWallpaper)wallpaper
{
  id v3 = self->_wallpaper;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaper"])
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
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    id v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaper"];

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

void __30__CNContact_alwaysFetchedKeys__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  id v4 = +[CN alwaysFetchedProperties];
  v1 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_8_2);
  uint64_t v2 = [v0 initWithArray:v1];
  id v3 = (void *)alwaysFetchedKeys_cn_once_object_1;
  alwaysFetchedKeys_cn_once_object_1 = v2;
}

uint64_t __31__CNContact_identifierProvider__block_invoke()
{
  identifierProvider_cn_once_object_2 = [[CNUuidIdentifierProvider alloc] initWithSuffix:@"ABPerson"];

  return MEMORY[0x1F41817F8]();
}

+ (NSComparator)comparatorForNameSortOrder:(CNContactSortOrder)sortOrder
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke;
  aBlock[3] = &__block_descriptor_40_e11_q24__0_8_16l;
  aBlock[4] = sortOrder;
  id v3 = _Block_copy(aBlock);
  id v4 = (void *)[v3 copy];

  return v4;
}

- (void)assertKeysAreAvailable:(id)a3
{
  id v5 = a3;
  if (!-[CNContact areKeysAvailable:](self, "areKeysAvailable:"))
  {
    id v4 = [v5 description];
    [MEMORY[0x1E4F1CA00] raise:@"CNPropertyNotFetchedException", @"Contact %p is missing some of the required key descriptors: %@", self, v4 format];
  }
}

+ (id)descriptorForRequiredKeysForSearchableItem
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CNContact_Spotlight__descriptorForRequiredKeysForSearchableItem__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  if (descriptorForRequiredKeysForSearchableItem_cn_once_token_1 != -1) {
    dispatch_once(&descriptorForRequiredKeysForSearchableItem_cn_once_token_1, block);
  }
  uint64_t v2 = (void *)descriptorForRequiredKeysForSearchableItem_cn_once_object_1;

  return v2;
}

void __66__CNContact_Spotlight__descriptorForRequiredKeysForSearchableItem__block_invoke(uint64_t a1)
{
  v9[24] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = +[CNContactFormatter descriptorForRequiredKeysForStyle:0];
  [v2 addObject:v3];

  v9[0] = @"namePrefix";
  v9[1] = @"givenName";
  v9[2] = @"middleName";
  v9[3] = @"familyName";
  v9[4] = @"nameSuffix";
  v9[5] = @"nickname";
  v9[6] = @"phoneticFamilyName";
  v9[7] = @"phoneticGivenName";
  v9[8] = @"phoneticMiddleName";
  v9[9] = @"phoneNumbers";
  v9[10] = @"emailAddresses";
  v9[11] = @"instantMessageAddresses";
  v9[12] = @"dates";
  v9[13] = @"postalAddresses";
  v9[14] = @"urlAddresses";
  v9[15] = @"socialProfiles";
  v9[16] = @"note";
  v9[17] = @"organizationName";
  v9[18] = @"contactType";
  v9[19] = @"departmentName";
  v9[20] = @"jobTitle";
  v9[21] = @"birthday";
  v9[22] = @"nonGregorianBirthday";
  v9[23] = @"creationDate";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:24];
  [v2 addObjectsFromArray:v4];

  id v5 = NSStringFromSelector(*(SEL *)(a1 + 32));
  BOOL v6 = +[CNContact descriptorWithKeyDescriptors:v2 description:v5];

  uint64_t v7 = [v6 copy];
  id v8 = (void *)descriptorForRequiredKeysForSearchableItem_cn_once_object_1;
  descriptorForRequiredKeysForSearchableItem_cn_once_object_1 = v7;
}

- (id)searchableItemForIndexing
{
  return [(CNContact *)self _searchableItemIncludingInternalAttributes:1];
}

- (id)searchableItemForDragging
{
  return [(CNContact *)self _searchableItemIncludingInternalAttributes:0];
}

- (id)searchableItemAttributeSetForUserActivity
{
  id v3 = (void *)[objc_alloc(getCSSearchableItemAttributeSetClass()) initWithItemContentType:@"public.contact"];
  id v4 = [(CNContact *)self identifier];
  [v3 setRelatedUniqueIdentifier:v4];

  return v3;
}

- (id)_searchableItemIncludingInternalAttributes:(BOOL)a3
{
  BOOL v77 = a3;
  v95[9] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)[objc_alloc(getCSSearchableItemAttributeSetClass()) initWithItemContentType:@"public.contact"];
  context = (void *)MEMORY[0x192FD3A40]();
  id v5 = +[CNContactFormatter stringFromContact:self style:0];
  v80 = v4;
  [v4 setDisplayName:v5];

  v85 = [(CNContact *)self namePrefix];
  v95[0] = v85;
  v83 = [(CNContact *)self givenName];
  v95[1] = v83;
  id obja = [(CNContact *)self middleName];
  v95[2] = obja;
  BOOL v6 = [(CNContact *)self familyName];
  v95[3] = v6;
  uint64_t v7 = [(CNContact *)self nameSuffix];
  v95[4] = v7;
  id v8 = [(CNContact *)self nickname];
  v95[5] = v8;
  id v9 = [(CNContact *)self phoneticFamilyName];
  v95[6] = v9;
  uint64_t v10 = [(CNContact *)self phoneticGivenName];
  v95[7] = v10;
  id v11 = [(CNContact *)self phoneticMiddleName];
  v95[8] = v11;
  char v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v95 count:9];
  v13 = [(CNContact *)self _filteredArrayForValidValues:v12];
  [v4 setAlternateNames:v13];

  uint64_t v14 = [(CNContact *)self phoneNumbers];
  uint64_t v15 = [v14 valueForKey:@"value"];
  v16 = [v15 valueForKey:@"stringValue"];
  uint64_t v17 = [(CNContact *)self _filteredArrayForValidValues:v16];

  v18 = [(CNContact *)self emailAddresses];
  id v19 = [v18 valueForKey:@"value"];
  uint64_t v20 = [(CNContact *)self _filteredArrayForValidValues:v19];

  id v21 = [(CNContact *)self instantMessageAddresses];
  BOOL v22 = [v21 valueForKey:@"value"];
  id v23 = [v22 valueForKey:@"username"];
  uint64_t v24 = [(CNContact *)self _filteredArrayForValidValues:v23];

  id v25 = [(CNContact *)self socialProfiles];
  int v26 = [v25 valueForKey:@"value"];
  uint64_t v27 = [v26 valueForKey:@"username"];
  uint64_t v28 = [(CNContact *)self _filteredArrayForValidValues:v27];

  [v80 setPhoneNumbers:v17];
  [v80 setEmailAddresses:v20];
  [v80 setInstantMessageAddresses:v24];
  v75 = (void *)v20;
  v76 = (void *)v17;
  v94[0] = v17;
  v94[1] = v20;
  v73 = (void *)v28;
  v74 = (void *)v24;
  v94[2] = v24;
  v94[3] = v28;
  id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v94 count:4];
  v30 = objc_msgSend(v29, "_cn_flatten");
  [v80 setAccountHandles:v30];

  uint64_t v31 = [(CNContact *)self note];
  [v80 setTextContent:v31];

  v32 = [(CNContact *)self organizationName];
  v93[0] = v32;
  uint64_t v33 = [(CNContact *)self departmentName];
  v93[1] = v33;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:2];
  BOOL v35 = [(CNContact *)self _filteredArrayForValidValues:v34];
  [v80 setOrganizations:v35];

  v36 = [(CNContact *)self jobTitle];
  [v80 setRole:v36];

  v37 = [(CNContact *)self dates];
  v38 = [v37 valueForKey:@"value"];
  id v39 = [v38 valueForKey:@"date"];
  v40 = (void *)[v39 mutableCopy];

  v41 = [(CNContact *)self birthday];
  uint64_t v42 = [v41 date];
  if (v42)
  {
    [v40 addObject:v42];
  }
  else
  {
    objc_super v43 = [MEMORY[0x1E4F1CA98] null];
    [v40 addObject:v43];
  }
  uint64_t v44 = [(CNContact *)self nonGregorianBirthday];
  char v45 = [v44 date];
  if (v45)
  {
    [v40 addObject:v45];
  }
  else
  {
    long long v46 = [MEMORY[0x1E4F1CA98] null];
    [v40 addObject:v46];
  }
  v72 = v40;
  long long v47 = [(CNContact *)self _filteredArrayForValidValues:v40];
  [v80 setImportantDates:v47];

  v86 = [MEMORY[0x1E4F1CA48] array];
  v79 = self;
  long long v48 = [(CNContact *)self postalAddresses];
  long long v49 = [v48 valueForKey:@"value"];

  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v49;
  uint64_t v50 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
  if (v50)
  {
    uint64_t v51 = v50;
    uint64_t v84 = *(void *)v88;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v88 != v84) {
          objc_enumerationMutation(obj);
        }
        v53 = *(void **)(*((void *)&v87 + 1) + 8 * i);
        BOOL v54 = [v53 street];
        v91[0] = v54;
        v55 = [v53 subLocality];
        v91[1] = v55;
        uint64_t v56 = [v53 city];
        v91[2] = v56;
        v57 = [v53 subAdministrativeArea];
        v91[3] = v57;
        v58 = [v53 state];
        v91[4] = v58;
        v59 = [v53 postalCode];
        v91[5] = v59;
        v60 = [v53 country];
        v91[6] = v60;
        v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v91 count:7];
        [v86 addObjectsFromArray:v61];
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v87 objects:v92 count:16];
    }
    while (v51);
  }

  v62 = [(CNContact *)v79 urlAddresses];
  v63 = [v62 valueForKey:@"value"];
  [v86 addObjectsFromArray:v63];

  v64 = [(CNContact *)v79 _filteredArrayForValidValues:v86];
  [v80 setAuthorAddresses:v64];

  v65 = +[CNDraggingContact availableDataRepresentationTypes];
  [v80 setProviderDataTypeIdentifiers:v65];

  if (v77)
  {
    v66 = [(CNContact *)v79 creationDate];
    [v80 setContentCreationDate:v66];
  }
  v67 = [(CNContact *)v79 identifier];
  +[CNEntitySpotlightIndexing associateAttributeSet:v80 withContactEntityIdentifiedBy:v67];

  id v68 = objc_alloc(getCSSearchableItemClass());
  v69 = [(CNContact *)v79 identifier];
  v70 = (void *)[v68 initWithUniqueIdentifier:v69 domainIdentifier:@"contact" attributeSet:v80];

  return v70;
}

- (id)_filteredArrayForValidValues:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if (([v10 isEqualToString:&stru_1EE052B80] & 1) == 0) {
              goto LABEL_14;
            }
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
LABEL_14:
              [v4 addObject:v10];
              continue;
            }
            id v11 = [(CNContact *)self _filteredArrayForValidValues:v10];
            if (([v11 isEqualToArray:MEMORY[0x1E4F1CBF0]] & 1) == 0) {
              [v4 addObject:v11];
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (NSPredicate)predicateForContactsInGroupWithIdentifier:(NSString *)groupIdentifier
{
  id v3 = groupIdentifier;
  id v4 = [[CNiOSABContactsInGroupPredicate alloc] initWithParentGroupIdentifier:v3];

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContactsMatchingName:(NSString *)name
{
  id v3 = name;
  id v4 = [(CNContactWithNamePredicate *)[CNiOSABContactWithNamePredicate alloc] initWithName:v3];

  return (NSPredicate *)v4;
}

+ (NSPredicate)predicateForContactsInContainerWithIdentifier:(NSString *)containerIdentifier
{
  id v3 = containerIdentifier;
  id v4 = [[CNiOSABContactsInContainerPredicate alloc] initWithParentContainerIdentifier:v3];

  return (NSPredicate *)v4;
}

+ (id)predicateForContactsMatchingName:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [(CNContactWithNamePredicate *)[CNiOSABContactWithNamePredicate alloc] initWithName:v5 options:a4];

  return v6;
}

+ (id)predicateForContactsWithOrganizationName:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABOrganizationNameContactPredicate alloc] initWithOrganizationName:v3];

  return v4;
}

+ (id)predicateForContactMatchingEmailAddress:(id)a3
{
  id v3 = a3;
  id v4 = [(CNEmailAddressContactPredicate *)[CNiOSABEmailAddressContactPredicate alloc] initWithEmailAddress:v3 returnMultipleResults:0];

  return v4;
}

+ (id)predicateForContactsMatchingEmailAddress:(id)a3 groupIdentifiers:(id)a4 limitToOneResult:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(CNEmailAddressContactPredicate *)[CNiOSABEmailAddressContactPredicate alloc] initWithEmailAddress:v8 groupIdentifiers:v7 returnMultipleResults:!v5];

  return v9;
}

+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 prefixHint:(id)a4 groupIdentifiers:(id)a5 limitToOneResult:(BOOL)a6
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:groupIdentifiers:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v11, v10, v9, !a6);

  return v12;
}

+ (id)predicateForContactsMatchingHandleStrings:(id)a3 inContainersWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(CNHandleStringsContactPredicate *)[CNiOSABHandleStringsContactPredicate alloc] initWithHandleStrings:v6 containerIdentifiers:v5];

  return v7;
}

+ (id)predicateForContactsMatchingPostalAddress:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABPostalAddressContactPredicate alloc] initWithPostalAddress:v3];

  return v4;
}

+ (id)predicateForContactsLinkedToContactWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [(CNLinkedContactsPredicate *)[CNiOSABLinkedContactsPredicate alloc] initWithContactIdentifier:v3];

  return v4;
}

+ (id)predicateForContactsLinkedToContact:(id)a3
{
  id v3 = a3;
  id v4 = [(CNLinkedContactsPredicate *)[CNiOSABLinkedContactsPredicate alloc] initWithContact:v3];

  return v4;
}

+ (id)predicateForContactsMatchingSmartDialerString:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABSmartDialerStringContactPredicate alloc] initWithString:v3];

  return v4;
}

+ (id)predicateForContactsMatchingFullTextSearch:(id)a3 containerIdentifiers:(id)a4 groupIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [[CNiOSABFullTextSearchContactPredicate alloc] initWithSearchString:v9 containerIdentifiers:v8 groupIdentifiers:v7];

  return v10;
}

+ (id)predicateForContactMatchingMapString:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABMapDataContactPredicate alloc] initWithString:v3];

  return v4;
}

+ (id)predicateForContactMatchingPhoneNumber:(id)a3
{
  id v3 = a3;
  id v4 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v3, 0);

  return v4;
}

+ (id)predicateForContactsMatchingPhoneNumber:(id)a3 prefixHint:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[CNPhoneNumberContactPredicate initWithPhoneNumber:prefixHint:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v6, v5, 1);

  return v7;
}

+ (id)predicateForContactMatchingPhoneNumberWithDigits:(id)a3 countryCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = -[CNPhoneNumberContactPredicate initWithDigits:countryCode:returnMultipleResults:]([CNiOSABPhoneNumberContactPredicate alloc], v6, v5, 0);

  return v7;
}

+ (id)predicateForPreferredNameInContainersWithIdentifiers:(id)a3 groupsWithIdentifiers:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[CNiOSABPreferredNameInContainersAndGroupsPredicate alloc] initWithContainerIdentifiers:v6 groupIdentifiers:v5];

  return v7;
}

+ (id)predicateForContactsMatchingString:(id)a3 accountIdentifier:(id)a4 containerIdentifier:(id)a5 groupIdentifier:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[CNiOSABStringMatchContactPredicate alloc] initWithSearchString:v12 accountIdentifier:v11 containerIdentifier:v10 groupIdentifier:v9];

  return v13;
}

+ (id)predicateForContactMatchingURLString:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABURLContactPredicate alloc] initWithURLString:v3];

  return v4;
}

+ (id)predicateForContactMatchingLabeledValueIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABLabeledValueContactPredicate alloc] initWithLabeledValueIdentifier:v3];

  return v4;
}

+ (id)predicateForContactMatchingEKParticipantWithName:(id)a3 emailAddress:(id)a4 URL:(id)a5 predicateDescription:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[CNiOSABEKParticipantPredicate alloc] initWithName:v12 URL:v10 emailAddress:v11 customDescription:v9];

  return v13;
}

+ (id)predicateForLegacyIdentifier:(unsigned int)a3
{
  id v3 = [[CNiOSABContactLegacyIdentifierPredicate alloc] initWithLegacyIdentifier:*(void *)&a3];

  return v3;
}

+ (id)predicateForContactsMatchingSocialProfile:(id)a3
{
  id v3 = a3;
  id v4 = [(CNSocialProfileContactPredicate *)[CNiOSABSocialProfileContactPredicate alloc] initWithSocialProfile:v3];

  return v4;
}

+ (id)predicateForContactsMatchingInstantMessageAddress:(id)a3
{
  id v3 = a3;
  id v4 = [[CNiOSABInstantMessageAddressContactPredicate alloc] initWithInstantMessageAddress:v3];

  return v4;
}

+ (id)predicateForContactsMatchingPreferredChannel:(id)a3 limitOne:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [[CNiOSABPreferredChannelContactPredicate alloc] initWithPreferredChannel:v5 limitOne:v4];

  return v6;
}

+ (id)predicateForContactsMatchingExternalUUIDs:(id)a3
{
  id v3 = a3;
  BOOL v4 = [(CNExternalUUIDContactPredicate *)[CNiOSABExternalUUIDContactPredicate alloc] initWithExternalUUIDs:v3];

  return v4;
}

+ (id)predicateForContactsWithNonUnifiedIdentifiers:(id)a3
{
  id v3 = a3;
  BOOL v4 = [[CNiOSABContactIdentifiersPredicate alloc] initWithIdentifiers:v3 ignoreUnifiedIdentifiers:1];

  return v4;
}

+ (id)predicateForFaultFulfillmentForLegacyIdentifier:(unsigned int)a3 identifier:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v5 = a4;
  id v6 = [[CNiOSABFaultFulfillmentPredicate alloc] initWithLegacyIdentifier:v4 identifier:v5];

  return v6;
}

+ (id)predicateForContactsMissingBackgroundColors
{
  uint64_t v2 = objc_alloc_init(CNiOSABMissingBackgroundColorsContactPredicate);

  return v2;
}

+ (id)predicateForContactsWithWallpaperMetadata
{
  uint64_t v2 = objc_alloc_init(CNiOSABWithWallpaperMetadataContactPredicate);

  return v2;
}

- (void)detachedPerson
{
  return [(CNContact *)self detachedPersonWithError:0];
}

- (void)detachedPersonWithError:(id *)a3
{
  ABRecordRef v5 = ABPersonCreate();
  if (![(CNContact *)self overwritePerson:v5 error:a3])
  {
    CFRelease(v5);
    return 0;
  }
  if (!v5) {
    return 0;
  }

  return (void *)CFAutorelease(v5);
}

- (BOOL)overwritePerson:(void *)a3
{
  return [(CNContact *)self overwritePerson:a3 error:0];
}

- (BOOL)overwritePerson:(void *)a3 error:(id *)a4
{
  id v7 = objc_alloc_init(CNiOSABDependentPropertiesUpdateContext);
  uint64_t v21 = 0;
  BOOL v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  id v8 = [(CNContact *)self keyVector];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __61__CNContact_iOSABLegacyCompatibility__overwritePerson_error___block_invoke;
  v16[3] = &unk_1E56B55C8;
  v16[4] = self;
  uint64_t v19 = a3;
  id v9 = v7;
  uint64_t v20 = a4;
  long long v17 = v9;
  v18 = &v21;
  [v8 enumeratePropertiesUsingBlock:v16];

  if (*((unsigned char *)v22 + 24))
  {
    id v10 = +[CNContactsEnvironment currentEnvironment];
    id v11 = [v10 loggerProvider];
    id v12 = [v11 contactsLogger];

    BOOL v13 = [(CNiOSABDependentPropertiesUpdateContext *)v9 flushPendingImageChangesToPerson:a3 logger:v12 error:a4];
    *((unsigned char *)v22 + 24) = v13;

    BOOL v14 = *((unsigned char *)v22 + 24) != 0;
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

void __61__CNContact_iOSABLegacyCompatibility__overwritePerson_error___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v10 = a2;
  id v5 = +[CN identifierDescription];
  id v6 = v10;
  if (v5 != v10)
  {
    id v7 = +[CN iOSLegacyIdentifierDescription];

    id v8 = v10;
    if (v7 == v10) {
      goto LABEL_6;
    }
    id v9 = [v10 CNValueForContact:a1[4]];
    id v6 = [v10 valueWithResetIdentifiers:v9];

    if (([v10 setCNValue:v6 onABPerson:a1[7] withDependentPropertiesContext:a1[5] error:a1[8]] & 1) == 0)
    {
      *a3 = 1;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
  }

  id v8 = v10;
LABEL_6:
}

+ (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4
{
  return (id)[a1 contactFromPerson:a3 keysToFetch:a4 mutable:0];
}

+ (id)contactFromPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = +[CNContact alwaysFetchedKeys];
  id v9 = [v8 allObjects];
  id v10 = [v7 arrayByAddingObjectsFromArray:v9];

  id v11 = +[CNiOSABConversions contactFromABPerson:keysToConvert:mutable:]((uint64_t)CNiOSABConversions, (uint64_t)a3, v10, v5);
  if ([v11 hasBeenPersisted])
  {
    CFArrayRef v12 = (const __CFArray *)CPRecordCopyChangedProperties();
    if (v12)
    {
      CFArrayRef v13 = v12;
      CFIndex Count = CFArrayGetCount(v12);
      if (Count >= 1)
      {
        CFIndex v15 = Count;
        long long v16 = (void *)[v11 mutableCopy];
        uint64_t v28 = v10;
        id v29 = v7;
        uint64_t v27 = v11;
        BOOL v26 = v5;
        if (contactFromPerson_keysToFetch_mutable__cn_once_token_0 != -1) {
          dispatch_once(&contactFromPerson_keysToFetch_mutable__cn_once_token_0, &__block_literal_global_48);
        }
        id v17 = (id)contactFromPerson_keysToFetch_mutable__cn_once_object_0;
        for (CFIndex i = 0; i != v15; ++i)
        {
          ValueAtIndedouble x = CFArrayGetValueAtIndex(v13, i);
          int v20 = (int)ValueAtIndex;
          uint64_t v21 = [NSNumber numberWithInt:ValueAtIndex];
          BOOL v22 = [v17 objectForKeyedSubscript:v21];

          v30[0] = MEMORY[0x1E4F143A8];
          v30[1] = 3221225472;
          v30[2] = __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke_3;
          v30[3] = &unk_1E56B5610;
          v32 = a3;
          int v33 = v20;
          id v23 = v16;
          id v31 = v23;
          [v22 enumerateObjectsUsingBlock:v30];
        }
        if (v26)
        {
          id v24 = v11;
          [v24 setSnapshot:v23];
          id v11 = v24;
        }
        else
        {
          id v24 = (id)[v11 mutableCopy];
          [v24 setSnapshot:v23];
          id v11 = (void *)[v24 copy];
        }
        id v10 = v28;

        id v7 = v29;
      }
      CFRelease(v13);
    }
  }

  return v11;
}

void __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke()
{
  id v3 = +[CN writableContactProperties];
  id v0 = objc_msgSend(v3, "_cn_groupBy:", &__block_literal_global_8_0);
  uint64_t v1 = [v0 copy];
  uint64_t v2 = (void *)contactFromPerson_keysToFetch_mutable__cn_once_object_0;
  contactFromPerson_keysToFetch_mutable__cn_once_object_0 = v1;
}

id __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke_2(uint64_t a1, void *a2)
{
  unsigned int v4 = 0;
  if ([a2 abPropertyID:&v4]) {
    [NSNumber numberWithInt:v4];
  }
  else {
  uint64_t v2 = [MEMORY[0x1E4F1CA98] null];
  }

  return v2;
}

void __77__CNContact_iOSABLegacyCompatibility__contactFromPerson_keysToFetch_mutable___block_invoke_3(uint64_t a1, void *a2)
{
  id v7 = a2;
  id v3 = (const void *)ABRecordCopyOriginalValue();
  ABRecordRef v4 = ABPersonCreate();
  ABRecordSetValue(v4, *(_DWORD *)(a1 + 48), v3, 0);
  uint64_t v5 = [v7 ABValueForABPerson:v4];
  if (v3) {
    CFRelease(v3);
  }
  if (v4) {
    CFRelease(v4);
  }
  id v6 = [v7 CNValueFromABValue:v5];
  [v7 setCNValue:v6 onContact:*(void *)(a1 + 32)];
}

+ (id)contactPropertyKeyFromABPropertyID:(int)a3
{
  ABRecordRef v4 = +[CN allContactProperties];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__CNContact_iOSABLegacyCompatibility__contactPropertyKeyFromABPropertyID___block_invoke;
  v8[3] = &__block_descriptor_36_e8_B16__0_8l;
  int v9 = a3;
  uint64_t v5 = objc_msgSend(v4, "_cn_firstObjectPassingTest:", v8);
  id v6 = [v5 key];

  return v6;
}

BOOL __74__CNContact_iOSABLegacyCompatibility__contactPropertyKeyFromABPropertyID___block_invoke(uint64_t a1, void *a2)
{
  int v5 = 0;
  int v3 = [a2 abPropertyID:&v5];
  BOOL result = 0;
  if (v3) {
    return v5 == *(_DWORD *)(a1 + 32);
  }
  return result;
}

+ (int)abPropertyIDfromContactPropertyKey:(id)a3
{
  id v3 = a3;
  ABRecordRef v4 = +[CN contactPropertiesByKey];
  int v5 = [v4 objectForKeyedSubscript:v3];

  int v7 = 0;
  [v5 abPropertyID:&v7];
  LODWORD(v4) = v7;

  return (int)v4;
}

- (BOOL)overwritePublicABPerson:(void *)a3
{
  id ABSPublicABCNCompatibilityClass = getABSPublicABCNCompatibilityClass();

  return [ABSPublicABCNCompatibilityClass overwritePublicABPerson:a3 withContact:self];
}

- (BOOL)updateNewPublicABPerson:(void *)a3 inAddressBook:(void *)a4
{
  id ABSPublicABCNCompatibilityClass = getABSPublicABCNCompatibilityClass();

  return [ABSPublicABCNCompatibilityClass updateNewPublicABPerson:a3 withSavedContact:self inAddressBook:a4];
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4
{
  return (id)[a1 contactFromPublicABPerson:a3 keysToFetch:a4 mutable:0];
}

+ (id)contactFromPublicABPerson:(void *)a3 keysToFetch:(id)a4 mutable:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [getABSPublicABCNCompatibilityClass() contactFromPublicABPerson:a3 keysToFetch:v7 mutable:v5];

  return v8;
}

+ (id)contactPropertyKeyFromPublicABPropertyID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id ABSPublicABCNCompatibilityClass = getABSPublicABCNCompatibilityClass();

  return (id)[ABSPublicABCNCompatibilityClass contactPropertyKeyFromPublicABPropertyID:v3];
}

+ (int)publicABPropertyIDFromContactPropertyKey:(id)a3
{
  id v3 = a3;
  int v4 = [getABSPublicABCNCompatibilityClass() publicABPropertyIDFromContactPropertyKey:v3];

  return v4;
}

+ (OS_os_log)os_log
{
  if (os_log_cn_once_token_0_16 != -1) {
    dispatch_once(&os_log_cn_once_token_0_16, &__block_literal_global_98);
  }
  uint64_t v2 = (void *)os_log_cn_once_object_0_16;

  return (OS_os_log *)v2;
}

uint64_t __19__CNContact_os_log__block_invoke()
{
  os_log_cn_once_object_0_16 = (uint64_t)os_log_create("com.apple.contacts", "api");

  return MEMORY[0x1F41817F8]();
}

- (NSString)searchIndex
{
  id v3 = self->_searchIndex;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"searchIndex"])
    {
      id v3 = &stru_1EE052B80;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  int v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    int v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"searchIndex"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    int v4 = v3;
    id v3 = &stru_1EE052B80;
    goto LABEL_11;
  }
LABEL_12:

  return (NSString *)v3;
}

- (id)wallpaperMetadata
{
  id v3 = self->_wallpaperMetadata;
  if (!v3)
  {
    availableKeyDescriptor = self->_availableKeyDescriptor;
    if (!availableKeyDescriptor
      || [(CNContactKeyVector *)availableKeyDescriptor containsKey:@"wallpaperMetadata"])
    {
      id v3 = 0;
      goto LABEL_12;
    }
    goto LABEL_9;
  }
  int v4 = +[CNLabeledValue emptyEntries];
  if (v3 != v4)
  {
LABEL_11:

    goto LABEL_12;
  }
  BOOL v5 = self->_availableKeyDescriptor;
  if (!v5)
  {
    int v4 = v3;
    goto LABEL_11;
  }
  BOOL v6 = [(CNContactKeyVector *)v5 containsKey:@"wallpaperMetadata"];

  if (!v6)
  {
LABEL_9:
    +[CNContact you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact];
    int v4 = v3;
    id v3 = 0;
    goto LABEL_11;
  }
LABEL_12:

  return v3;
}

- (NSString)cardDAVUID
{
  uint64_t v2 = (void *)[(NSString *)self->_cardDAVUID copy];

  return (NSString *)v2;
}

- (NSDictionary)activityAlerts
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [(CNContact *)self callAlert];
  objc_msgSend(v3, "_cn_setNonNilObject:forKey:", v4, @"callAlert");

  BOOL v5 = [(CNContact *)self textAlert];
  objc_msgSend(v3, "_cn_setNonNilObject:forKey:", v5, @"textAlert");

  return (NSDictionary *)v3;
}

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)[MEMORY[0x1E4F5A430] localizedStringForString:key class:a1 returningNilIfNotFound:1];
}

+ (CNContact)contactWithIdentifierOnly:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  BOOL v6 = +[CNContactKeyVector keyVectorWithKey:@"identifier"];
  id v7 = (void *)[v5 initWithIdentifier:v4 availableKeyDescriptor:v6];

  return (CNContact *)v7;
}

+ (id)contact
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

+ (CNContact)contactWithDisplayName:(id)a3 emailOrPhoneNumber:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    id v14 = v6;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = a3;
    id v10 = [v8 arrayWithObjects:&v14 count:1];
    id v11 = objc_msgSend(a1, "contactWithDisplayName:handleStrings:", v9, v10, v14, v15);
  }
  else
  {
    id v12 = a3;
    id v11 = [a1 contactWithDisplayName:v12 handleStrings:MEMORY[0x1E4F1CBF0]];
  }

  return (CNContact *)v11;
}

+ (CNContact)contactWithDisplayName:(id)a3 handleStrings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    +[CNContact contactWithDisplayName:handleStrings:].cold.5();
  }

  uint64_t v9 = *MEMORY[0x1E4F5A298];
  int v10 = (*(uint64_t (**)(void, id))(*MEMORY[0x1E4F5A298] + 16))(*MEMORY[0x1E4F5A298], v6);
  id v11 = objc_msgSend(a1, "os_log");
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG);
  if (v10)
  {
    if (v12) {
      +[CNContact contactWithDisplayName:handleStrings:]();
    }
  }
  else if (v12)
  {
    +[CNContact contactWithDisplayName:handleStrings:].cold.4();
  }

  CFArrayRef v13 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    +[CNContact contactWithDisplayName:handleStrings:](v7, v13);
  }

  id v14 = objc_alloc_init(CNMutableContact);
  if (((*(uint64_t (**)(uint64_t, id))(v9 + 16))(v9, v6) & 1) == 0)
  {
    uint64_t v15 = [MEMORY[0x1E4F5A470] componentsFromString:v6];
    [v15 overrideComponentsInContact:v14];
  }
  long long v16 = [MEMORY[0x1E4F5A410] classificationOfHandleStrings:v7];
  id v17 = [[CNContactClassifiedHandleStringInterpreter alloc] initWithHandleStringClassification:v16];
  v18 = [(CNContactClassifiedHandleStringInterpreter *)v17 emailAddresses];
  [(CNMutableContact *)v14 setEmailAddresses:v18];

  uint64_t v19 = [(CNContactClassifiedHandleStringInterpreter *)v17 phoneNumbers];
  [(CNMutableContact *)v14 setPhoneNumbers:v19];

  [a1 freezeIfInstancetypeIsImmutable:v14];
  int v20 = objc_msgSend(a1, "os_log");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    +[CNContact contactWithDisplayName:handleStrings:]();
  }

  return (CNContact *)v14;
}

+ (void)freezeIfInstancetypeIsImmutable:(id)a3
{
  id v3 = (id)[a3 freeze];
}

- (CNContact)initWithIdentifier:(id)a3 persisted:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[CNContactKeyVector keyVectorWithKey:@"identifier"];
  id v8 = [(CNContact *)self initWithIdentifier:v6 availableKeyDescriptor:v7];

  if (v8)
  {
    if (v4)
    {
      uint64_t v9 = [(CNContact *)v8 copy];
      snapshot = v8->_snapshot;
      v8->_snapshot = (CNContact *)v9;
    }
    id v11 = v8;
  }

  return v8;
}

uint64_t __72__CNContact__contactWithContact_createNewInstance_propertyDescriptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _contactWithContact:a2 createNewInstance:*(unsigned __int8 *)(a1 + 48) propertyDescriptions:*(void *)(a1 + 32)];
}

+ (id)emptyContact
{
  if (emptyContact_cn_once_token_11 != -1) {
    dispatch_once(&emptyContact_cn_once_token_11, &__block_literal_global_248);
  }
  id v2 = (void *)emptyContact_cn_once_object_11;

  return v2;
}

uint64_t __25__CNContact_emptyContact__block_invoke()
{
  emptyContact_cn_once_object_11 = objc_alloc_init(CNContact);

  return MEMORY[0x1F41817F8]();
}

+ (id)newContactWithPropertyKeys:(id)a3 withValuesFromContact:(id)a4
{
  id v5 = a4;
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = [v6 set];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke;
  v18 = &unk_1E56B7F18;
  id v19 = v8;
  id v20 = v5;
  id v9 = v5;
  id v10 = v8;
  [v7 enumerateObjectsUsingBlock:&v15];

  id v11 = objc_opt_class();
  BOOL v12 = objc_msgSend(v10, "allObjects", v15, v16, v17, v18);
  CFArrayRef v13 = [v11 _contactWithContact:v9 createNewInstance:1 propertyDescriptions:v12];

  return v13;
}

void __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_CNIsObject_CNKeyDescriptorPrivate(v3))
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke_2;
    v4[3] = &unk_1E56B7EF0;
    id v5 = *(id *)(a1 + 32);
    id v6 = *(id *)(a1 + 40);
    objc_msgSend(v3, "_cn_executeGetterForRepresentedKeys:", v4);
  }
}

id __62__CNContact_newContactWithPropertyKeys_withValuesFromContact___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[CN contactPropertiesByKey];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (v5)
  {
    [*(id *)(a1 + 32) addObject:v5];
    if ([*(id *)(a1 + 40) isKeyAvailable:v3]) {
      [v5 CNValueForContact:*(void *)(a1 + 40)];
    }
    else {
    id v6 = [v5 nilValue];
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)copyWithPropertyKeys:(id)a3
{
  BOOL v4 = (void *)MEMORY[0x1E4F1CA80];
  id v5 = a3;
  id v6 = [v4 set];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  id v14 = __34__CNContact_copyWithPropertyKeys___block_invoke;
  uint64_t v15 = &unk_1E56B7F18;
  uint64_t v16 = self;
  id v17 = v6;
  id v7 = v6;
  [v5 enumerateObjectsUsingBlock:&v12];

  id v8 = objc_opt_class();
  id v9 = objc_msgSend(v7, "allObjects", v12, v13, v14, v15, v16);
  id v10 = [v8 _contactWithContact:self createNewInstance:0 propertyDescriptions:v9];

  return v10;
}

void __34__CNContact_copyWithPropertyKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (_CNIsObject_CNKeyDescriptorPrivate(v3))
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__CNContact_copyWithPropertyKeys___block_invoke_2;
    v5[3] = &unk_1E56B7EF0;
    BOOL v4 = *(void **)(a1 + 40);
    v5[4] = *(void *)(a1 + 32);
    id v6 = v4;
    objc_msgSend(v3, "_cn_executeGetterForRepresentedKeys:", v5);
  }
}

id __34__CNContact_copyWithPropertyKeys___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[CN contactPropertiesByKey];
  id v5 = [v4 objectForKeyedSubscript:v3];

  if (v5 && [*(id *)(a1 + 32) isKeyAvailable:v3])
  {
    [*(id *)(a1 + 40) addObject:v5];
    id v6 = [v5 CNValueForContact:*(void *)(a1 + 32)];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)copyWithDistinctIdentifier
{
  id v3 = objc_opt_class();
  BOOL v4 = +[CN allContactProperties];
  id v5 = [v3 _contactWithContact:self createNewInstance:1 propertyDescriptions:v4];
  id v6 = (void *)[v5 mutableCopy];

  [v6 updateStateFromContact:0];
  +[CN resetRestrictedPropertiesOnMutableContact:v6];
  id v7 = (void *)[v6 copy];

  return v7;
}

- (id)copyWithSelfAsSnapshot
{
  id v2 = (void *)[(CNContact *)self mutableCopy];
  id v3 = [v2 freezeWithSelfAsSnapshot];

  return v3;
}

- selfOrMutableCopy
{
  void *v2;
  uint64_t vars8;

  id v2 = (void *)[(CNContact *)self mutableCopy];

  return v2;
}

+ (id)makeContactAndMergeValuesFromAvailableKeysInContact:(id)a3
{
  id v4 = a3;
  id v5 = +[CN allContactProperties];
  id v6 = [a1 _contactWithContact:v4 createNewInstance:1 propertyDescriptions:v5];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContact)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CNContact *)self init];
  if (v5)
  {
    id v6 = v5;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", objc_opt_class(), 0);
      id v8 = [v4 decodeObjectOfClasses:v7 forKey:@"availableKeyDescriptor"];
      uint64_t v9 = [v8 copy];
      availableKeyDescriptor = v6->_availableKeyDescriptor;
      v6->_availableKeyDescriptor = (CNContactKeyVector *)v9;
    }
    else
    {
      uint64_t v12 = [v4 decodeArrayOfObjectsOfClass:objc_opt_class() forKey:@"availableKeys_v2"];
      id v7 = (void *)[v12 copy];

      if (!v7)
      {
        uint64_t v13 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v14 = objc_opt_class();
        uint64_t v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
        uint64_t v16 = [v4 decodeObjectOfClasses:v15 forKey:@"availableKeys"];
        id v7 = [v16 allObjects];
      }
      uint64_t v17 = +[CNContactKeyVector keyVectorWithKeys:v7];
      id v8 = v6->_availableKeyDescriptor;
      v6->_availableKeyDescriptor = (CNContactKeyVector *)v17;
    }

    v18 = v6->_availableKeyDescriptor;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __27__CNContact_initWithCoder___block_invoke;
    v50[3] = &unk_1E56B58F8;
    id v19 = v4;
    id v51 = v19;
    id v20 = v6;
    v52 = v20;
    [(CNContactKeyVector *)v18 enumeratePropertiesUsingBlock:v50];
    uint64_t v21 = +[CN runtimeOnlyProperties];
    uint64_t v44 = MEMORY[0x1E4F143A8];
    uint64_t v45 = 3221225472;
    long long v46 = __27__CNContact_initWithCoder___block_invoke_2;
    long long v47 = &unk_1E56B7F40;
    id v22 = v19;
    id v48 = v22;
    id v11 = v20;
    long long v49 = v11;
    objc_msgSend(v21, "_cn_each:", &v44);

    id v23 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v24 = objc_opt_class();
    id v25 = objc_msgSend(v23, "setWithObjects:", v24, objc_opt_class(), 0, v44, v45, v46, v47);
    BOOL v26 = [v22 decodeObjectOfClasses:v25 forKey:@"snapshot"];
    uint64_t v27 = [v26 copy];
    snapshot = v11->_snapshot;
    v11->_snapshot = (CNContact *)v27;

    id v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    id v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v32 = [v22 decodeObjectOfClasses:v31 forKey:@"linkedContacts"];
    uint64_t v33 = [v32 copy];
    linkedContacts = v11->_linkedContacts;
    v11->_linkedContacts = (NSArray *)v33;

    BOOL v35 = [v22 decodeObjectOfClass:objc_opt_class() forKey:@"storeIdentifier"];
    uint64_t v36 = [v35 copy];
    storeIdentifier = v11->_storeIdentifier;
    v11->_storeIdentifier = (NSString *)v36;

    v38 = +[CNContact storeInfoFromCoder:v22 storeIdentifier:v11->_storeIdentifier key:@"storeInfo"];
    uint64_t v39 = [v38 copy];
    storeInfo = v11->_storeInfo;
    v11->_storeInfo = (NSDictionary *)v39;

    if (!v11->_internalIdentifier)
    {

      v41 = os_log_create("com.apple.contacts", "data-access-error");
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[CNContact initWithCoder:]();
      }

      uint64_t v42 = +[CNErrorFactory errorWithCode:2 userInfo:0];
      [v22 failWithError:v42];

      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t __27__CNContact_initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return [a2 decodeUsingCoder:*(void *)(a1 + 32) contact:*(void *)(a1 + 40)];
}

uint64_t __27__CNContact_initWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 decodeUsingCoder:*(void *)(a1 + 32) contact:*(void *)(a1 + 40)];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    id v6 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F1CA80] set];
  }
  availableKeyDescriptor = self->_availableKeyDescriptor;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __29__CNContact_encodeWithCoder___block_invoke;
  v16[3] = &unk_1E56B7F68;
  id v8 = v4;
  id v17 = v8;
  v18 = self;
  id v9 = v6;
  id v19 = v9;
  [(CNContactKeyVector *)availableKeyDescriptor enumeratePropertiesUsingBlock:v16];
  id v10 = +[CN runtimeOnlyProperties];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __29__CNContact_encodeWithCoder___block_invoke_2;
  v13[3] = &unk_1E56B7F40;
  id v11 = v8;
  id v14 = v11;
  uint64_t v15 = self;
  objc_msgSend(v10, "_cn_each:", v13);

  if (isKindOfClass)
  {
    [v11 encodeObject:self->_availableKeyDescriptor forKey:@"availableKeyDescriptor"];
  }
  else
  {
    uint64_t v12 = [v9 allObjects];
    [v11 encodeObject:v12 forKey:@"availableKeys_v2"];
  }
  [v11 encodeObject:self->_snapshot forKey:@"snapshot"];
  [v11 encodeObject:self->_linkedContacts forKey:@"linkedContacts"];
  [v11 encodeObject:self->_storeIdentifier forKey:@"storeIdentifier"];
  [v11 encodeObject:self->_storeInfo forKey:@"storeInfo"];
}

void __29__CNContact_encodeWithCoder___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  [v5 encodeUsingCoder:v3 contact:v4];
  id v6 = (void *)a1[6];
  id v7 = [v5 key];

  [v6 addObject:v7];
}

uint64_t __29__CNContact_encodeWithCoder___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 encodeUsingCoder:*(void *)(a1 + 32) contact:*(void *)(a1 + 40)];
}

+ (id)storeInfoFromCoder:(id)a3 storeIdentifier:(id)a4 key:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = +[CNContactStore storeClassWithIdentifier:a4];
  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, objc_opt_class(), 0);
    uint64_t v15 = +[CNSecureCodingClassSets contactStoreClasses];
    LODWORD(v12) = [v15 containsObject:v9];

    if (v12)
    {
      uint64_t v16 = [(objc_class *)v9 storeInfoClasses];
      if (v16)
      {
        id v17 = (void *)v16;
        uint64_t v18 = [v14 setByAddingObjectsFromSet:v16];

        id v14 = (void *)v18;
      }
    }
    id v9 = [v7 decodeObjectOfClasses:v14 forKey:v8];
  }

  return v9;
}

- (CNKeyDescriptor)availableKeyDescriptor
{
  return (CNKeyDescriptor *)self->_availableKeyDescriptor;
}

- (NSSet)availableKeys
{
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  availableKeyDescriptor = self->_availableKeyDescriptor;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__CNContact_availableKeys__block_invoke;
  v8[3] = &unk_1E56B5988;
  id v9 = v3;
  id v5 = v3;
  [(CNContactKeyVector *)availableKeyDescriptor enumeratePropertiesUsingBlock:v8];
  id v6 = (void *)[v5 copy];

  return (NSSet *)v6;
}

void __26__CNContact_availableKeys__block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  [v2 addObject:v3];
}

- (BOOL)isUnifiedWithContactWithIdentifier:(NSString *)contactIdentifier
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = contactIdentifier;
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))() && [(CNContact *)self isUnified])
  {
    id v5 = [(CNContact *)self identifier];
    char v6 = [v5 isEqualToString:v4];

    if (v6)
    {
      BOOL v7 = 1;
    }
    else
    {
      v10[0] = v4;
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      BOOL v7 = [(CNContact *)self isUnifiedWithContactsWithIdentifiers:v9];
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)isUnifiedWithContactsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ([(CNContact *)self isUnified])
  {
    if ([v4 count])
    {
      id v5 = (void *)MEMORY[0x1E4F1CAD0];
      char v6 = [(CNContact *)self allLinkedIdentifiers];
      BOOL v7 = [v5 setWithArray:v6];

      id v8 = [MEMORY[0x1E4F1CAD0] setWithArray:v4];
      char v9 = [v8 isSubsetOfSet:v7];
    }
    else
    {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)allLinkedIdentifiers
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = [(CNContact *)self identifier];
  id v5 = [v3 arrayWithObject:v4];

  if ([(CNContact *)self isUnified])
  {
    char v6 = [(CNContact *)self linkedContacts];
    BOOL v7 = objc_msgSend(v6, "_cn_map:", &__block_literal_global_288);
    [v5 addObjectsFromArray:v7];
  }

  return v5;
}

uint64_t __33__CNContact_allLinkedIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return [a2 identifier];
}

+ (id)descriptorForAllComparatorKeys
{
  return +[CNContactFormatter descriptorForRequiredKeysForStyle:1003];
}

+ (CNKeyDescriptor)descriptorForAllImageDataKeys
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[CN allImageDataPropertyKeys];
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  id v4 = +[CNContact descriptorWithKeyDescriptors:description:](CNContact, "descriptorWithKeyDescriptors:description:", v3, @"+[CNContact descriptorForAllImageDataKeys]");

  return (CNKeyDescriptor *)v4;
}

id __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) isKeyAvailable:v3])
  {
    id v4 = +[CN contactPropertiesByKey];
    id v5 = [v4 objectForKeyedSubscript:v3];

    char v6 = [v5 CNValueForContact:*(void *)(a1 + 32)];
  }
  else if ([*(id *)(a1 + 40) containsKey:v3])
  {
    BOOL v7 = +[CN contactPropertiesByKey];
    id v8 = [v7 objectForKeyedSubscript:v3];

    char v6 = [v8 nilValue];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    [*(id *)(a1 + 48) addKey:v3];
    char v6 = 0;
  }

  return v6;
}

void __63__CNContact_areKeysAvailable_useIgnorableKeys_findMissingKeys___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  [v2 addObject:v3];
}

- (id)linkedContactsFromStoreWithIdentifier:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (unint64_t)a3;
  id v5 = [(CNContact *)self linkedContacts];
  if ([v5 count])
  {
    char v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v18 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          uint64_t v13 = [v12 storeIdentifier];
          if (v4 | v13)
          {
            id v14 = (void *)v13;
            uint64_t v15 = [v12 storeIdentifier];
            int v16 = [v15 isEqual:v4];

            if (!v16) {
              continue;
            }
          }
          [v6 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v9);
    }

    id v5 = v18;
  }
  else
  {
    char v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (NSArray)mainStoreLinkedContacts
{
  return (NSArray *)[(CNContact *)self linkedContactsFromStoreWithIdentifier:0];
}

- (NSString)stringForIndexing
{
  id v3 = objc_alloc_init(CNContactSearchIndexFormatter);
  unint64_t v4 = [(CNContactSearchIndexFormatter *)v3 stringFromContact:self];

  return (NSString *)v4;
}

- (NSArray)termsOfAddress
{
  id v2 = [(CNContact *)self addressingGrammars];
  id v3 = objc_msgSend(v2, "_cn_compactMap:", &__block_literal_global_299);

  return (NSArray *)v3;
}

id __27__CNContact_termsOfAddress__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 value];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A250] + 16))()) {
    id v3 = 0;
  }
  else {
    id v3 = v2;
  }
  id v4 = v3;

  return v4;
}

- (BOOL)isImplicitAugmentation
{
  return [(CNContact *)self flags] & 1;
}

- (NSString)fullName
{
  return +[CNContactFormatter stringFromContact:self style:0];
}

- (NSString)phoneticFullName
{
  return +[CNContactFormatter stringFromContact:self style:1];
}

- (BOOL)hasChanges
{
  id v2 = self;
  id v3 = [(CNContact *)self snapshot];
  LOBYTE(v2) = ![(CNContact *)v2 isEqual:v3];

  return (char)v2;
}

- (id)diffToSnapshotAndReturnError:(id *)a3
{
  id v5 = [(CNContact *)self snapshot];
  char v6 = +[CNContactDiff diffContact:v5 to:self error:a3];

  return v6;
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNContact *)self identifier];
  id v5 = (id)[v3 appendName:@"identifier" object:v4];

  if ([(CNContact *)self isKeyAvailable:@"givenName"]) {
    givenName = (__CFString *)self->_givenName;
  }
  else {
    givenName = @"(not fetched)";
  }
  id v7 = (id)[v3 appendName:@"givenName" object:givenName];
  if ([(CNContact *)self isKeyAvailable:@"familyName"]) {
    familyName = (__CFString *)self->_familyName;
  }
  else {
    familyName = @"(not fetched)";
  }
  id v9 = (id)[v3 appendName:@"familyName" object:familyName];
  if ([(CNContact *)self isKeyAvailable:@"organizationName"]) {
    organizationName = (__CFString *)self->_organizationName;
  }
  else {
    organizationName = @"(not fetched)";
  }
  id v11 = (id)[v3 appendName:@"organizationName" object:organizationName];
  if ([(CNContact *)self isKeyAvailable:@"phoneNumbers"]) {
    phoneNumbers = self->_phoneNumbers;
  }
  else {
    phoneNumbers = (NSArray *)@"(not fetched)";
  }
  id v13 = (id)[v3 appendName:@"phoneNumbers" object:phoneNumbers];
  if ([(CNContact *)self isKeyAvailable:@"emailAddresses"]) {
    emailAddresses = self->_emailAddresses;
  }
  else {
    emailAddresses = (NSArray *)@"(not fetched)";
  }
  id v15 = (id)[v3 appendName:@"emailAddresses" object:emailAddresses];
  if ([(CNContact *)self isKeyAvailable:@"postalAddresses"]) {
    postalAddresses = self->_postalAddresses;
  }
  else {
    postalAddresses = (NSArray *)@"(not fetched)";
  }
  id v17 = (id)[v3 appendName:@"postalAddresses" object:postalAddresses];
  uint64_t v18 = [v3 build];

  return (NSString *)v18;
}

- (id)shortDebugDescription
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNContact *)self identifier];
  id v5 = (id)[v3 appendName:@"identifier" object:v4];

  if ([(CNContact *)self isKeyAvailable:@"givenName"]) {
    givenName = (__CFString *)self->_givenName;
  }
  else {
    givenName = @"(not fetched)";
  }
  id v7 = (id)[v3 appendName:@"givenName" object:givenName];
  if ([(CNContact *)self isKeyAvailable:@"familyName"]) {
    familyName = (__CFString *)self->_familyName;
  }
  else {
    familyName = @"(not fetched)";
  }
  id v9 = (id)[v3 appendName:@"familyName" object:familyName];
  uint64_t v10 = [v3 build];

  return v10;
}

uint64_t __21__CNContact_isEqual___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) storeIdentifier];
  if (!v3)
  {
    uint64_t v1 = [*(id *)(a1 + 40) storeIdentifier];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) storeIdentifier];
  id v5 = [*(id *)(a1 + 40) storeIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

uint64_t __21__CNContact_isEqual___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) areAllAvailableKeysEqualToContact:*(void *)(a1 + 40) ignoringIdentifiers:0];
}

uint64_t __21__CNContact_isEqual___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) areAllPropertiesButContactIdentifierEqualToContact:*(void *)(a1 + 40)];
}

- (BOOL)areAllAvailableKeysEqualToContact:(id)a3 ignoringIdentifiers:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CNContact *)self availableKeyDescriptor];
  uint64_t v8 = [v6 availableKeyDescriptor];

  if (v7 == v8)
  {
    char v17 = 1;
  }
  else
  {
    if (v4)
    {
      if (areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_token_13 != -1) {
        dispatch_once(&areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_token_13, &__block_literal_global_314);
      }
      id v9 = (id)areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_object_13;
      uint64_t v10 = [(CNContact *)self keyVector];
      id v11 = (void *)[v10 mutableCopy];

      uint64_t v12 = [v6 keyVector];
      id v13 = (void *)[v12 mutableCopy];

      [v11 minusKeyVector:v9];
      [v13 minusKeyVector:v9];

      id v15 = v11;
      int v16 = v13;
    }
    else
    {
      id v11 = [(CNContact *)self keyVector];
      uint64_t v14 = [v6 keyVector];
      id v13 = (void *)v14;
      id v15 = v11;
      int v16 = (void *)v14;
    }
    char v17 = __67__CNContact_areAllAvailableKeysEqualToContact_ignoringIdentifiers___block_invoke(v14, v15, v16);
  }
  return v17;
}

uint64_t __67__CNContact_areAllAvailableKeysEqualToContact_ignoringIdentifiers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = v4;
  if (a2 && v4)
  {
    uint64_t v6 = [a2 isEqualToKeyVector:v4];
LABEL_7:
    uint64_t v7 = v6;
    goto LABEL_8;
  }
  if (([a2 containsAllKeys] & 1) == 0)
  {
    uint64_t v6 = [v5 containsAllKeys];
    goto LABEL_7;
  }
  uint64_t v7 = 1;
LABEL_8:

  return v7;
}

void __67__CNContact_areAllAvailableKeysEqualToContact_ignoringIdentifiers___block_invoke_2()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v3[0] = @"identifier";
  v3[1] = @"iOSLegacyIdentifier";
  v3[2] = @"linkIdentifier";
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:3];
  uint64_t v1 = +[CNContactKeyVector keyVectorWithKeys:v0];
  id v2 = (void *)areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_object_13;
  areAllAvailableKeysEqualToContact_ignoringIdentifiers__cn_once_object_13 = v1;
}

- (BOOL)areAllPropertiesButContactIdentifierEqualToContact:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = +[CN allContactProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = +[CN identifierDescription];

        if (v10 != v11)
        {
          uint64_t v12 = [v10 key];
          BOOL v13 = [(CNContact *)self isKeyAvailable:v12];

          if (v13 && ![v10 isEqualForContact:self other:v4])
          {
            BOOL v14 = 0;
            goto LABEL_13;
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (BOOL)isProperty:(id)a3 equalToOtherIgnoreIdentifiers:(id)a4
{
  return [a3 isEqualIgnoringIdentifiersForContact:self other:a4];
}

- (BOOL)areAllPropertiesEqualToContactIgnoringIdentifiers:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = +[CN writableContactProperties];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v11 = [v10 key];
        BOOL v12 = [(CNContact *)self isKeyAvailable:v11];

        if (v12
          && ![(CNContact *)self isProperty:v10 equalToOtherIgnoreIdentifiers:v4])
        {
          BOOL v13 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_12:

  return v13;
}

- (BOOL)isEqualIgnoringIdentifiers:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __40__CNContact_isEqualIgnoringIdentifiers___block_invoke;
  v16[3] = &unk_1E56B3E18;
  void v16[4] = self;
  id v17 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  BOOL v12 = __40__CNContact_isEqualIgnoringIdentifiers___block_invoke_2;
  BOOL v13 = &unk_1E56B3E18;
  BOOL v14 = self;
  id v15 = v17;
  id v7 = v17;
  uint64_t v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __40__CNContact_isEqualIgnoringIdentifiers___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) areAllAvailableKeysEqualToContact:*(void *)(a1 + 40) ignoringIdentifiers:1];
}

uint64_t __40__CNContact_isEqualIgnoringIdentifiers___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) areAllPropertiesEqualToContactIgnoringIdentifiers:*(void *)(a1 + 40)];
}

uint64_t __40__CNContact_comparatorForNameSortOrder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v22[9] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = objc_alloc_init(CNContactFormatter);
  [(CNContactFormatter *)v7 setStyle:1003];
  [(CNContactFormatter *)v7 setSortOrder:*(void *)(a1 + 32)];
  v22[0] = @"familyName";
  v22[1] = @"phoneticFamilyName";
  v22[2] = @"givenName";
  v22[3] = @"phoneticGivenName";
  v22[4] = @"middleName";
  v22[5] = @"phoneticMiddleName";
  v22[6] = @"nickname";
  v22[7] = @"organizationName";
  v22[8] = @"phoneticOrganizationName";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:9];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke_2;
  aBlock[3] = &unk_1E56B80A0;
  id v9 = v8;
  id v21 = v9;
  uint64_t v10 = (uint64_t (**)(void *, void *))_Block_copy(aBlock);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
      BOOL v12 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v19 = [(CNContactFormatter *)v7 stringFromContact:v5 attributes:v11];
      BOOL v13 = [(CNContactFormatter *)v7 stringFromContact:v6 attributes:v12];
      int v14 = v10[2](v10, v11);
      int v15 = v10[2](v10, v12);
      if (!v14 || v15)
      {
        if ((v15 ^ 1 | v14) == 1)
        {
          id v17 = v19;
          uint64_t v16 = [v19 localizedStandardCompare:v13];
LABEL_11:

          goto LABEL_12;
        }
        uint64_t v16 = 1;
      }
      else
      {
        uint64_t v16 = -1;
      }
      id v17 = v19;
      goto LABEL_11;
    }
  }
  uint64_t v16 = 0;
LABEL_12:

  return v16;
}

uint64_t __40__CNContact_comparatorForNameSortOrder___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke_3;
  v6[3] = &unk_1E56B8078;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v6];
  uint64_t v4 = *((unsigned __int8 *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return v4;
}

void __40__CNContact_comparatorForNameSortOrder___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__CNContact_comparatorForNameSortOrder___block_invoke_4;
  v7[3] = &unk_1E56B8050;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = v5;
  uint64_t v9 = v6;
  [a3 enumerateKeysAndObjectsUsingBlock:v7];
}

void __40__CNContact_comparatorForNameSortOrder___block_invoke_4(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a3;
  if ([a2 isEqual:@"contactProperty"]
    && [*(id *)(a1 + 32) containsObject:v7])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

+ (id)preferredImageComparator
{
  if (preferredImageComparator_cn_once_token_14 != -1) {
    dispatch_once(&preferredImageComparator_cn_once_token_14, &__block_literal_global_325);
  }
  id v2 = (void *)preferredImageComparator_cn_once_object_14;

  return v2;
}

void __37__CNContact_preferredImageComparator__block_invoke()
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = &__block_literal_global_323;
  id v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  uint64_t v1 = CNAggregateComparator();
  uint64_t v2 = [v1 copy];
  id v3 = (void *)preferredImageComparator_cn_once_object_14;
  preferredImageComparator_cn_once_object_14 = v2;
}

- (id)linkedIdentifierMap
{
  id v3 = [(CNContact *)self snapshot];
  uint64_t v4 = [(CNContact *)self linkedContacts];
  id v5 = +[CN identifierMapForUnifiedContact:v3 backingContacts:v4];

  return v5;
}

+ (id)unifyContacts:(id)a3
{
  return +[CN contactUnifyingContacts:a3 includingMainStoreContacts:1 allowMutableContactFreeze:0];
}

+ (id)previewURLForContact:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = (objc_class *)MEMORY[0x1E4F29088];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  int v6 = [v4 isUnified];
  id v7 = @"NO";
  if (v6) {
    id v7 = @"YES";
  }
  id v8 = v7;
  [v5 setScheme:@"addressbook"];
  uint64_t v9 = [v4 identifier];

  [v5 setHost:v9];
  uint64_t v10 = [MEMORY[0x1E4F290C8] queryItemWithName:@"unify" value:v8];

  v14[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  [v5 setQueryItems:v11];

  char v12 = [v5 URL];

  return v12;
}

+ (void)you_used_a_property_that_you_didnt_request_when_you_fetched_the_contact
{
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (NSString)cropRectID
{
  return self->_cropRectID;
}

- (NSData)cropRectHash
{
  return self->_cropRectHash;
}

- (NSString)sortingGivenName
{
  return self->_sortingGivenName;
}

- (NSString)sortingFamilyName
{
  return self->_sortingFamilyName;
}

- (int64_t)displayNameOrder
{
  return self->_displayNameOrder;
}

- (NSArray)relatedNames
{
  uint64_t v2 = [(CNContact *)self contactRelations];
  id v3 = [v2 valueForKey:@"name"];

  return (NSArray *)v3;
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v4[3] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.contacts.contact.persisted";
  v4[1] = @"com.apple.contacts.contact";
  void v4[2] = *MEMORY[0x1E4F22718];
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:3];

  return (NSArray *)v2;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([a1 isContactUTIType:v9])
  {
    uint64_t v10 = [a1 contactWithArchivedData:v8 error:a5];
LABEL_5:
    uint64_t v11 = (void *)v10;
    goto LABEL_9;
  }
  if ([a1 isVCardDataUTIType:v9])
  {
    uint64_t v10 = [a1 contactWithVCardData:v8 error:a5];
    goto LABEL_5;
  }
  char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4866 userInfo:0];
  BOOL v13 = v12;
  if (a5) {
    *a5 = v12;
  }

  uint64_t v11 = 0;
LABEL_9:

  return v11;
}

+ (BOOL)isContactUTIType:(id)a3
{
  id v3 = (__CFString *)a3;
  if (UTTypeConformsTo(v3, @"com.apple.contacts.contact")) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = UTTypeConformsTo(v3, @"com.apple.contacts.contact.persisted") != 0;
  }

  return v4;
}

+ (BOOL)isVCardDataUTIType:(id)a3
{
  return UTTypeConformsTo((CFStringRef)a3, (CFStringRef)*MEMORY[0x1E4F22718]) != 0;
}

+ (CNContact)contactWithArchivedData:(id)a3 error:(id *)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F5A328];
  id v6 = a3;
  id v15 = 0;
  id v7 = [v5 decodeObjectOfClass:objc_opt_class() data:v6 error:&v15];

  id v8 = v15;
  id v9 = v8;
  if (v7)
  {
    id v10 = v7;
  }
  else
  {
    if (v8)
    {
      uint64_t v16 = *MEMORY[0x1E4F28A50];
      v17[0] = v8;
      uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    }
    else
    {
      uint64_t v11 = 0;
    }
    char v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:4864 userInfo:v11];
    BOOL v13 = v12;
    if (a4) {
      *a4 = v12;
    }
  }

  return (CNContact *)v7;
}

+ (CNContact)contactWithVCardData:(id)a3 error:(id *)a4
{
  id v5 = +[CNContactVCardSerialization contactsWithData:error:](CNContactVCardSerialization, "contactsWithData:error:", a3);
  id v6 = v5;
  if (v5)
  {
    if ([v5 count])
    {
      id v7 = [v6 objectAtIndexedSubscript:0];
      goto LABEL_6;
    }
    CNSetError(a4, 700, 0);
  }
  id v7 = 0;
LABEL_6:

  return (CNContact *)v7;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.contacts.contact";
  uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return (NSArray *)v2;
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  v15[1] = *MEMORY[0x1E4F143B8];
  if ([(CNContact *)self hasBeenPersisted]) {
    id v3 = @"com.apple.contacts.contact.persisted";
  }
  else {
    id v3 = @"com.apple.contacts.contact";
  }
  BOOL v4 = +[CNContactVCardSerialization descriptorForRequiredKeys];
  v15[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  BOOL v6 = [(CNContact *)self areKeysAvailable:v5];

  if (v6)
  {
    uint64_t v7 = *MEMORY[0x1E4F22718];
    v14[0] = v3;
    v14[1] = v7;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = (__CFString **)v14;
    uint64_t v10 = 2;
  }
  else
  {
    BOOL v13 = v3;
    id v8 = (void *)MEMORY[0x1E4F1C978];
    id v9 = &v13;
    uint64_t v10 = 1;
  }
  uint64_t v11 = [v8 arrayWithObjects:v9 count:v10];

  return (NSArray *)v11;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *, void))a4;
  if ([(id)objc_opt_class() isContactUTIType:v6])
  {
    id v8 = [MEMORY[0x1E4F5A328] encodeObject:self error:0];
    v7[2](v7, v8, 0);
  }
  else if ([(id)objc_opt_class() isVCardDataUTIType:v6])
  {
    v15[0] = self;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v14 = 0;
    uint64_t v10 = +[CNContactVCardSerialization dataWithContacts:v9 error:&v14];
    id v11 = v14;

    if (v10) {
      id v12 = 0;
    }
    else {
      id v12 = v11;
    }
    ((void (**)(id, void *, id))v7)[2](v7, v10, v12);
  }
  else
  {
    v7[2](v7, 0, 0);
  }

  return 0;
}

+ (id)contactFromSuggestion:(id)a3
{
  return CNContactFromSGContact(a3, 0);
}

+ (id)contactIdentifierFromSuggestionID:(id)a3
{
  id v3 = CNSuggestedContactFoundInBundle_block_invoke((uint64_t)a1, (uint64_t)a3);
  BOOL v4 = +[CNContactStore contactIdentifierFromInternalIdentifier:v3];

  return v4;
}

+ (id)suggestionIDFromContactIdentifier:(id)a3
{
  id v3 = +[CNContactStore internalIdentifierFromContactIdentifier:a3];
  BOOL v4 = CNSuggestedContactFoundInBundle_block_invoke_2((uint64_t)v3, v3);

  return v4;
}

- (BOOL)isSuggested
{
  id v5 = [(CNContact *)self storeIdentifier];
  if (!v5)
  {
    uint64_t v2 = +[CNSuggestedContactStore storeIdentifier];
    if (!v2)
    {
      char v8 = 1;
      goto LABEL_14;
    }
  }
  id v6 = [(CNContact *)self storeIdentifier];
  uint64_t v7 = +[CNSuggestedContactStore storeIdentifier];
  if (([v6 isEqual:v7] & 1) == 0)
  {
    id v9 = [(CNContact *)self storeIdentifier];
    if (v9
      || (+[CNDonationMapper mapperIdentifier],
          (id v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v10 = [(CNContact *)self storeIdentifier];
      id v11 = +[CNDonationMapper mapperIdentifier];
      char v8 = [v10 isEqual:v11];

      if (v9)
      {

        goto LABEL_13;
      }
    }
    else
    {
      char v8 = 1;
    }

LABEL_13:
    if (v5) {
      goto LABEL_15;
    }
LABEL_14:

    goto LABEL_15;
  }

  char v8 = 1;
  if (!v5) {
    goto LABEL_14;
  }
LABEL_15:

  return v8;
}

- (BOOL)isSuggestedMe
{
  BOOL v4 = [(CNContact *)self storeIdentifier];
  if (!v4)
  {
    uint64_t v2 = +[CNDonationMapper mapperIdentifier];
    if (!v2)
    {
      char v7 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v5 = [(CNContact *)self storeIdentifier];
  id v6 = +[CNDonationMapper mapperIdentifier];
  char v7 = [v5 isEqual:v6];

  if (!v4) {
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (SGRecordId)suggestionRecordId
{
  uint64_t v2 = [(CNContact *)self storeInfo];
  id v3 = [v2 objectForKey:CNSuggestedContactRecordIdKey];

  return (SGRecordId *)v3;
}

- (NSString)suggestionFoundInBundleId
{
  uint64_t v2 = [(CNContact *)self storeInfo];
  id v3 = [v2 objectForKey:CNSuggestedContactFoundInBundle];

  return (NSString *)v3;
}

- (id)copyWithCuratingAllSuggestions
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)hasSuggestedProperties
{
  v27[5] = *MEMORY[0x1E4F143B8];
  v27[0] = @"phoneNumbers";
  v27[1] = @"emailAddresses";
  v27[2] = @"postalAddresses";
  v27[3] = @"socialProfiles";
  v27[4] = @"dates";
  [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:5];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        if ([(CNContact *)self isKeyAvailable:v8])
        {
          id v9 = [(CNContact *)self valueForKey:v8];
          long long v17 = 0u;
          long long v18 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v18;
            while (2)
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v18 != v13) {
                  objc_enumerationMutation(v10);
                }
                if ([*(id *)(*((void *)&v17 + 1) + 8 * j) isSuggested])
                {

                  BOOL v15 = 1;
                  goto LABEL_21;
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
      BOOL v15 = 0;
    }
    while (v5);
  }
  else
  {
    BOOL v15 = 0;
  }
LABEL_21:

  return v15;
}

+ (id)predicateForSuggestionIdentifier:(unint64_t)a3
{
  id v3 = [[CNSuggestedContactIdentifierPredicate alloc] initWithSuggestionIdentifier:a3];

  return v3;
}

- (NSUUID)id
{
  uint64_t v3 = sub_190B76E88();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v7 = self;
  uint64_t v8 = [(CNContact *)v7 identifier];
  if (!v8)
  {
    sub_190B77168();
    uint64_t v8 = (NSString *)sub_190B77158();
    swift_bridgeObjectRelease();
  }
  id v9 = objc_msgSend(self, sel_uuidFromContactIdentifier_, v8);

  sub_190B76E68();
  id v10 = (void *)sub_190B76E58();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (NSUUID *)v10;
}

+ (void)contactWithDisplayName:handleStrings:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEBUG, "< +[CNContact contactWithDisplayName:handleStrings:]", v1, 2u);
}

+ (void)contactWithDisplayName:(void *)a1 handleStrings:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [a1 count];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1909E3000, a2, OS_LOG_TYPE_DEBUG, "    handleStrings: %lu", v3, 0xCu);
}

+ (void)contactWithDisplayName:handleStrings:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEBUG, "    displayName: %{public}@", v1, 0xCu);
}

+ (void)contactWithDisplayName:handleStrings:.cold.4()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEBUG, "    displayName: %@", v1, 0xCu);
}

+ (void)contactWithDisplayName:handleStrings:.cold.5()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1909E3000, v0, OS_LOG_TYPE_DEBUG, "> +[CNContact contactWithDisplayName:handleStrings:]", v1, 2u);
}

- (void)initWithIdentifier:(void *)a1 availableKeyDescriptor:.cold.1(void *a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = a1;
  objc_opt_class();
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_1909E3000, v1, OS_LOG_TYPE_FAULT, "parameter ‘internalIdentifier’ must be nonnull and of type %{public}@", v2, 0xCu);
}

+ (void)_contactWithContact:createNewInstance:propertyDescriptions:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1909E3000, v0, OS_LOG_TYPE_FAULT, "parameter ‘propertyDescriptions’ must be nonnull", v1, 2u);
}

+ (void)_contactWithContact:createNewInstance:propertyDescriptions:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_fault_impl(&dword_1909E3000, v0, OS_LOG_TYPE_FAULT, "parameter ‘contact’ must be nonnull", v1, 2u);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1909E3000, v0, OS_LOG_TYPE_ERROR, "Error decoding CNContact: no internal identifier", v1, 2u);
}

@end