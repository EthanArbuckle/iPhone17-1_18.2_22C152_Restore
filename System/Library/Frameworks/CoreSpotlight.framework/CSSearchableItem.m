@interface CSSearchableItem
+ (BOOL)supportsSecureCoding;
+ (id)searchableItemFromUserActivity:(id)a3 bundleID:(id)a4;
- (BOOL)_hasAttributesOfType:(id)a3;
- (BOOL)_isFullyFormed;
- (BOOL)_standardizeExternalAnalysisTags:(id)a3 forAttributeSet:(id)a4 primaryAttribute:(id)a5 analysisAttributes:(id)a6 specializedAttributes:(id)a7 standardizeBlock:(id)a8;
- (BOOL)_standardizeNumericAnalysisTags:(id)a3 forAttributeSet:(id)a4 primaryAttribute:(id)a5 analysisAttributes:(id)a6 specializedAttributes:(id)a7 standardizeBlock:(id)a8;
- (BOOL)allowTextStore;
- (BOOL)isAppEntity;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUpdate;
- (BOOL)noIndex;
- (CSSearchableItem)init;
- (CSSearchableItem)initWithAttributeSet:(id)a3;
- (CSSearchableItem)initWithCoder:(id)a3;
- (CSSearchableItem)initWithUniqueIdentifier:(NSString *)uniqueIdentifier domainIdentifier:(NSString *)domainIdentifier attributeSet:(CSSearchableItemAttributeSet *)attributeSet;
- (CSSearchableItemAttributeSet)attributeSet;
- (NSComparisonResult)compareByRank:(CSSearchableItem *)other;
- (NSDate)expirationDate;
- (NSString)bundleID;
- (NSString)domainIdentifier;
- (NSString)protection;
- (NSString)uniqueIdentifier;
- (id)_propertiesDescription;
- (id)attributes;
- (id)copyReconstructedAdditionalRecipients;
- (id)copyReconstructedAuthors;
- (id)copyReconstructedHiddenAdditionalRecipients;
- (id)copyReconstructedPrimaryRecipients;
- (id)copyReconstructedRecipients;
- (id)copyWithZone:(_NSZone *)a3;
- (id)debugDescription;
- (id)description;
- (id)filteredSpotlightAttributes;
- (int64_t)compareByEmbeddingDistance:(id)a3;
- (uint64_t)score;
- (unint64_t)hash;
- (void)_fixBrokenAuthorNames:(id)a3;
- (void)_parseEmailHeadersForFeatures:(id)a3;
- (void)_populateMissingPeopleWithNames:(id)a3 emailAddresses:(id)a4 allItemPersons:(id)a5 primaryItemPersons:(id)a6 additionalItemPersons:(id)a7 hiddenAdditionalItemPersons:(id)a8 personDictionary:(id)a9 contactProperties:(id)a10 nameKey:(id)a11 emailKey:(id)a12 contactIdentifierKey:(id)a13 personKey:(id)a14 photosPersonIdentifierKey:(id)a15 personTypeKey:(id)a16 nameAlternativesKey:(id)a17 faceAttributesKey:(id)a18 attributeSet:(id)a19;
- (void)_standardizeDocumentUnderstandingCategories:(id)a3;
- (void)_standardizeDocumentUnderstandingTopics:(id)a3;
- (void)_standardizeExtractedEntities:(id)a3;
- (void)_standardizeExtractedNumericEntities:(id)a3;
- (void)_standardizeFileProvider:(id)a3;
- (void)_standardizeHTML:(id)a3;
- (void)_standardizeMarkAs:(id)a3;
- (void)_standardizePeople:(id)a3;
- (void)_standardizePortrait:(id)a3;
- (void)_standardizeSceneClassification:(id)a3;
- (void)_standardizeSiriShortcuts:(id)a3;
- (void)_updateWithSearchableItem:(id)a3;
- (void)breakOutPersonInformationInSet:(id)a3 withName:(id)a4 emails:(id)a5 contactIdentifiers:(id)a6 photosPersonIdentifiers:(id)a7 personType:(id)a8 nameAlternatives:(id)a9 nameAlternativesCounts:(id)a10 faceAttributes:(id)a11 faceAttributesCounts:(id)a12 nameKey:(id)a13 emailKey:(id)a14 contactIdentifierKey:(id)a15 emailAddressKey:(id)a16 photosPersonIdentifierKey:(id)a17 personTypeKey:(id)a18 nameAlternativesKey:(id)a19 faceAttributesKey:(id)a20 attributeSet:(id)a21;
- (void)encodeWithCoder:(id)a3;
- (void)extractAndStandardizePersonInformation:(id)a3 contactIdentifierKey:(id)a4 emailKey:(id)a5 nameKey:(id)a6 emailAddressExtractKey:(id)a7 photosPersonIdentifierKey:(id)a8 personTypeKey:(id)a9 nameAlternativesKey:(id)a10 faceAttributesKey:(id)a11 contactIdentifiers:(id)a12 emails:(id)a13 names:(id)a14 photosPersonIdentifiers:(id)a15 personType:(id)a16 nameAlternatives:(id)a17 nameAlternativesCounts:(id)a18 faceAttributes:(id)a19 faceAttributesCounts:(id)a20 persons:(id)a21;
- (void)setAllowTextStore:(BOOL)a3;
- (void)setAttributeSet:(CSSearchableItemAttributeSet *)attributeSet;
- (void)setAttributes:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setDomainIdentifier:(NSString *)domainIdentifier;
- (void)setExpirationDate:(NSDate *)expirationDate;
- (void)setIsAppEntity:(BOOL)a3;
- (void)setIsUpdate:(BOOL)a3;
- (void)setNoIndex:(BOOL)a3;
- (void)setProtection:(id)a3;
- (void)setScore:(CSSearchableItem *)self;
- (void)setUniqueIdentifier:(NSString *)uniqueIdentifier;
- (void)standardizeAttributesForBundle:(id)a3 protectionClass:(id)a4;
@end

@implementation CSSearchableItem

- (void).cxx_destruct
{
}

- (void)_standardizePeople:(id)a3
{
  id v50 = a3;
  [(CSSearchableItem *)self _fixBrokenAuthorNames:v50];
  v4 = [v50 authorNames];
  v5 = [v50 emailAddresses];
  v6 = [v50 authors];
  v7 = [v50 attributeForKey:@"kMDItemAuthorsDictionary"];
  v8 = [v50 attributeForKey:@"kMDItemAuthorContactProperties"];
  -[CSSearchableItem _populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "_populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v4, v5, v6, 0, 0, 0, v7, v8, @"kMDItemAuthors", @"kMDItemAuthorEmailAddresses", @"kMDItemAuthorContactIdentifiers", @"kMDItemAuthorPersons", @"kMDItemAuthorPhotosPersonIdentifiers", @"kMDItemPhotosPeopleTypes", @"kMDItemPhotosPeopleNamesAlternatives",
    @"kMDItemPhotosPeopleFaceAttributes",
    v50);

  v9 = [v50 primaryRecipients];
  uint64_t v10 = [v9 count];

  if (v10)
  {
    v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = [v50 primaryRecipients];
    [v11 addObjectsFromArray:v12];
  }
  else
  {
    v11 = 0;
  }
  v13 = [v50 additionalRecipients];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    if (!v11)
    {
      v11 = [MEMORY[0x1E4F1CA48] array];
    }
    v15 = [v50 additionalRecipients];
    [v11 addObjectsFromArray:v15];
  }
  v16 = [v50 hiddenAdditionalRecipients];
  uint64_t v17 = [v16 count];

  if (v17)
  {
    if (!v11)
    {
      v11 = [MEMORY[0x1E4F1CA48] array];
    }
    v18 = [v50 hiddenAdditionalRecipients];
    [v11 addObjectsFromArray:v18];
  }
  v19 = [v50 attributeForKey:@"kMDItemPrimaryRecipientsDictionary"];
  if ([v19 count])
  {
    v20 = [MEMORY[0x1E4F1CA60] dictionary];
    [v20 addEntriesFromDictionary:v19];
  }
  else
  {
    v20 = 0;
  }
  v21 = [v50 attributeForKey:@"kMDItemAdditionalRecipientsDictionary"];

  if ([v21 count])
  {
    if (!v20)
    {
      v20 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v20 addEntriesFromDictionary:v21];
  }
  v22 = [v50 attributeForKey:@"kMDItemHiddenAdditionalRecipientsDictionary"];

  v47 = v22;
  if ([v22 count])
  {
    if (!v20)
    {
      v20 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    [v20 addEntriesFromDictionary:v22];
  }
  v23 = [v50 attributeForKey:@"kMDItemPrimaryRecipientContactProperties"];
  if ([v23 count])
  {
    v24 = [MEMORY[0x1E4F1CA48] array];
    [v24 addObjectsFromArray:v23];
  }
  else
  {
    v24 = 0;
  }
  v25 = [v50 attributeForKey:@"kMDItemAdditionalRecipientContactProperties"];

  if ([v25 count])
  {
    if (!v24)
    {
      v24 = [MEMORY[0x1E4F1CA48] array];
    }
    [v24 addObjectsFromArray:v25];
  }
  v26 = [v50 attributeForKey:@"kMDItemHiddenAdditionalRecipientContactProperties"];

  if ([v26 count])
  {
    if (!v24)
    {
      v24 = [MEMORY[0x1E4F1CA48] array];
    }
    [v24 addObjectsFromArray:v26];
  }
  v48 = v24;
  v49 = v20;
  v46 = v26;
  v27 = self;
  if ([v11 count]) {
    v28 = 0;
  }
  else {
    v28 = @"kMDItemPrimaryRecipientPersons";
  }
  v29 = [v50 recipientNames];
  v30 = [v50 recipientEmailAddresses];
  v31 = [v50 primaryRecipients];
  v32 = [v50 additionalRecipients];
  v33 = [v50 hiddenAdditionalRecipients];
  v45 = v28;
  -[CSSearchableItem _populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](v27, "_populateMissingPeopleWithNames:emailAddresses:allItemPersons:primaryItemPersons:additionalItemPersons:hiddenAdditionalItemPersons:personDictionary:contactProperties:nameKey:emailKey:contactIdentifierKey:personKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v29, v30, v11, v31, v32, v33, v49, v48, @"kMDItemRecipients", @"kMDItemRecipientEmailAddresses", @"kMDItemRecipientContactIdentifiers", v28, @"kMDItemRecipientPhotosPersonIdentifiers", @"kMDItemPhotosPeopleTypes", @"kMDItemPhotosPeopleNamesAlternatives",
    @"kMDItemPhotosPeopleFaceAttributes",
    v50);

  v34 = [v50 photosPeople];
  if ([v34 count])
  {
    -[CSSearchableItem extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:](v27, "extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:", v50, @"kMDItemPhotosPeopleContactIdentifiers", 0, @"kMDItemPhotosPeopleNames", 0, @"kMDItemPhotosPeoplePersonIdentifiers", @"kMDItemPhotosPeopleTypes", @"kMDItemPhotosPeopleNamesAlternatives", @"kMDItemPhotosPeopleFaceAttributes", 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      v34);
    v35 = v27;
    v37 = v11;
    v36 = v48;
    v39 = v45;
    v38 = v46;
LABEL_39:
    v40 = v50;
    goto LABEL_40;
  }
  BOOL v42 = [(CSSearchableItem *)v27 isUpdate];
  v35 = v27;
  v37 = v11;
  v36 = v48;
  v39 = v45;
  v38 = v46;
  v40 = v50;
  if (v42)
  {
    int v43 = [v50 attributeIsDelete:@"kMDItemPhotosPeople"];
    v40 = v50;
    if (v43)
    {
      uint64_t v44 = *MEMORY[0x1E4F1D260];
      [v50 setAttribute:*MEMORY[0x1E4F1D260] forKey:@"kMDItemPhotosPeopleContactIdentifiers"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleNames"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeoplePersonIdentifiers"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleTypes"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleNamesAlternatives"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleNamesAlternativesCounts"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleFaceAttributes"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleFaceAttributesCounts"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeopleEmailAddresses"];
      [v50 setAttribute:v44 forKey:@"kMDItemPhotosPeoplePhoneNumbers"];
      goto LABEL_39;
    }
  }
LABEL_40:
  v41 = [v40 photosSharedLibraryContributors];
  if ([v41 count]) {
    -[CSSearchableItem extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:](v35, "extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:", v50, @"kMDItemPhotosSharedLibraryContributorsContactIdentifiers", 0, @"kMDItemPhotosSharedLibraryContributorsNames", 0, @"kMDItemPhotosSharedLibraryContributorsPersonIdentifiers", 0, @"kMDItemPhotosSharedLibraryContributorsNamesAlternatives", 0, 0, 0, 0, 0, 0, 0,
  }
      0,
      0,
      0,
      v41);
}

- (CSSearchableItemAttributeSet)attributeSet
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_attributeSet;
  objc_sync_exit(v2);

  return v3;
}

- (void)_populateMissingPeopleWithNames:(id)a3 emailAddresses:(id)a4 allItemPersons:(id)a5 primaryItemPersons:(id)a6 additionalItemPersons:(id)a7 hiddenAdditionalItemPersons:(id)a8 personDictionary:(id)a9 contactProperties:(id)a10 nameKey:(id)a11 emailKey:(id)a12 contactIdentifierKey:(id)a13 personKey:(id)a14 photosPersonIdentifierKey:(id)a15 personTypeKey:(id)a16 nameAlternativesKey:(id)a17 faceAttributesKey:(id)a18 attributeSet:(id)a19
{
  v143[1] = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = a4;
  id v112 = a5;
  id v115 = a6;
  id v114 = a7;
  id v113 = a8;
  id v26 = a9;
  id v27 = a10;
  id v104 = a11;
  id v105 = a12;
  id v106 = a13;
  id v103 = a14;
  id v107 = a15;
  id v109 = a16;
  id v110 = a17;
  id v108 = a18;
  id v118 = a19;
  v120 = v24;
  uint64_t v28 = [v24 count];
  v119 = v25;
  uint64_t v29 = [v25 count];
  if (v28) {
    BOOL v30 = v29 == 0;
  }
  else {
    BOOL v30 = 1;
  }
  int v32 = !v30 && v28 == v29;
  v122 = v26;
  uint64_t v33 = [v26 count];
  v102 = v27;
  uint64_t v34 = [v27 count];
  uint64_t v134 = 0;
  v135 = &v134;
  uint64_t v136 = 0x3032000000;
  v137 = __Block_byref_object_copy__2;
  v138 = __Block_byref_object_dispose__2;
  id v139 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __335__CSSearchableItem_Internal___populateMissingPeopleWithNames_emailAddresses_allItemPersons_primaryItemPersons_additionalItemPersons_hiddenAdditionalItemPersons_personDictionary_contactProperties_nameKey_emailKey_contactIdentifierKey_personKey_photosPersonIdentifierKey_personTypeKey_nameAlternativesKey_faceAttributesKey_attributeSet___block_invoke;
  aBlock[3] = &unk_1E5549398;
  aBlock[4] = &v134;
  v123 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  if ([v115 count]) {
    v124 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v115];
  }
  else {
    v124 = 0;
  }
  if ([v114 count]) {
    v116 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v114];
  }
  else {
    v116 = 0;
  }
  if (!v113)
  {
    v117 = 0;
    if (v32) {
      goto LABEL_18;
    }
LABEL_24:
    if (v33)
    {
      if (!v124) {
        v124 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v115];
      }
      [v26 allKeys];
      long long v131 = 0u;
      long long v132 = 0u;
      long long v129 = 0u;
      long long v130 = 0u;
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [v40 countByEnumeratingWithState:&v129 objects:v142 count:16];
      if (v41)
      {
        uint64_t v42 = *(void *)v130;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v130 != v42) {
              objc_enumerationMutation(v40);
            }
            uint64_t v44 = *(void *)(*((void *)&v129 + 1) + 8 * i);
            v45 = [v122 objectForKeyedSubscript:v44];
            uint64_t v141 = v44;
            v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v141 count:1];
            v47 = v123[2](v123, v45, v46);
            [v124 addObject:v47];
          }
          uint64_t v41 = [v40 countByEnumeratingWithState:&v129 objects:v142 count:16];
        }
        while (v41);
      }
    }
    else
    {
      if (!v34) {
        goto LABEL_36;
      }
      if (!v124) {
        v124 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v115];
      }
      if (!v135[5])
      {
        v86 = +[CSContactsWrapper sharedInstance];
        uint64_t v87 = [v86 CNContactEmailAddressesKeyString];
        v88 = (void *)v135[5];
        v135[5] = v87;
      }
      long long v127 = 0u;
      long long v128 = 0u;
      long long v125 = 0u;
      long long v126 = 0u;
      id v40 = v102;
      uint64_t v89 = [v40 countByEnumeratingWithState:&v125 objects:v140 count:16];
      if (v89)
      {
        uint64_t v90 = *(void *)v126;
        do
        {
          for (uint64_t j = 0; j != v89; ++j)
          {
            if (*(void *)v126 != v90) {
              objc_enumerationMutation(v40);
            }
            v92 = *(void **)(*((void *)&v125 + 1) + 8 * j);
            v93 = [v92 key];
            int v94 = [v93 isEqualToString:v135[5]];

            if (v94)
            {
              v95 = [v92 contact];
              v96 = [v95 givenName];
              v97 = [v92 value];
              v98 = [v97 allObjects];
              v99 = v123[2](v123, v96, v98);

              v100 = [v92 contact];
              v101 = [v100 identifier];
              [v99 setContactIdentifier:v101];

              [v124 addObject:v99];
            }
          }
          uint64_t v89 = [v40 countByEnumeratingWithState:&v125 objects:v140 count:16];
        }
        while (v89);
      }
    }

    goto LABEL_36;
  }
  v117 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v113];
  if (!v32) {
    goto LABEL_24;
  }
LABEL_18:
  if (!v124) {
    v124 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v115];
  }
  uint64_t v35 = 0;
  do
  {
    v36 = [v24 objectAtIndexedSubscript:v35];
    v37 = [v25 objectAtIndexedSubscript:v35];
    v143[0] = v37;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:1];
    v39 = v123[2](v123, v36, v38);
    [v124 addObject:v39];

    ++v35;
  }
  while (v28 != v35);
LABEL_36:
  if (v112) {
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v112];
  }
  else {
    v48 = 0;
  }
  if ([v48 count])
  {
    if (!v103) {
      goto LABEL_44;
    }
    v49 = [v48 array];
    [v118 setAttribute:v49 forKey:v103];
  }
  else
  {
    v49 = v48;
    v48 = 0;
  }

LABEL_44:
  if ([v124 count])
  {
    id v50 = [v124 array];
    [v118 setAttribute:v50 forKey:@"kMDItemPrimaryRecipientPersons"];
  }
  if ([v116 count])
  {
    v51 = [v116 array];
    [v118 setAttribute:v51 forKey:@"kMDItemAdditionalRecipientPersons"];
  }
  if ([v117 count])
  {
    v52 = [v117 array];
    [v118 setAttribute:v52 forKey:@"kMDItemHiddenAdditionalRecipientPersons"];
  }
  if (v124)
  {
    v53 = [v118 attributeForKey:@"kMDItemPrimaryRecipients"];
    v54 = [v118 attributeForKey:@"kMDItemPrimaryRecipientEmailAddresses"];
    v55 = [v118 attributeForKey:@"kMDItemPrimaryRecipientContactIdentifiers"];
    uint64_t v56 = v135[5];
    if (!v56)
    {
      v57 = +[CSContactsWrapper sharedInstance];
      uint64_t v58 = [v57 CNContactEmailAddressesKeyString];
      v59 = (void *)v135[5];
      v135[5] = v58;

      uint64_t v56 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v124, v53, v54, v55, 0, 0, 0, 0, 0, 0, @"kMDItemPrimaryRecipients", @"kMDItemPrimaryRecipientEmailAddresses", @"kMDItemPrimaryRecipientContactIdentifiers", v56, 0,
      0,
      0,
      0,
      v118);
  }
  if (v116)
  {
    v60 = [v118 attributeForKey:@"kMDItemAdditionalRecipients"];
    v61 = [v118 attributeForKey:@"kMDItemAdditionalRecipientEmailAddresses"];
    v62 = [v118 attributeForKey:@"kMDItemAdditionalRecipientContactIdentifiers"];
    uint64_t v63 = v135[5];
    if (!v63)
    {
      v64 = +[CSContactsWrapper sharedInstance];
      uint64_t v65 = [v64 CNContactEmailAddressesKeyString];
      v66 = (void *)v135[5];
      v135[5] = v65;

      uint64_t v63 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v116, v60, v61, v62, 0, 0, 0, 0, 0, 0, @"kMDItemAdditionalRecipients", @"kMDItemAdditionalRecipientEmailAddresses", @"kMDItemAdditionalRecipientContactIdentifiers", v63, 0,
      0,
      0,
      0,
      v118);
  }
  if (v117)
  {
    v67 = [v118 attributeForKey:@"kMDItemHiddenAdditionalRecipients"];
    v68 = [v118 attributeForKey:@"kMDItemHiddenAdditionalRecipientEmailAddresses"];
    v69 = [v118 attributeForKey:@"kMDItemHiddenAdditionalRecipientContactIdentifiers"];
    uint64_t v70 = v135[5];
    if (!v70)
    {
      v71 = +[CSContactsWrapper sharedInstance];
      uint64_t v72 = [v71 CNContactEmailAddressesKeyString];
      v73 = (void *)v135[5];
      v135[5] = v72;

      uint64_t v70 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v117, v67, v68, v69, 0, 0, 0, 0, 0, 0, @"kMDItemHiddenAdditionalRecipients", @"kMDItemHiddenAdditionalRecipientEmailAddresses", @"kMDItemHiddenAdditionalRecipientContactIdentifiers", v70, 0,
      0,
      0,
      0,
      v118);
  }
  if (v48)
  {
    v74 = [v118 attributeForKey:v104];
    v75 = [v118 attributeForKey:v105];
    v76 = [v118 attributeForKey:v106];
    v77 = [v118 attributeForKey:v107];
    v121 = [v118 attributeForKey:v109];
    v78 = [v118 attributeForKey:v110];
    v79 = [v118 attributeForKey:@"kMDItemPhotosPeopleNamesAlternativesCounts"];
    v80 = [v118 attributeForKey:v108];
    v81 = [v118 attributeForKey:@"kMDItemPhotosPeopleFaceAttributesCounts"];
    if (v117 || v116 || v124)
    {
      [v48 removeAllObjects];
      [v48 unionOrderedSet:v124];
      [v48 unionOrderedSet:v116];
      [v48 unionOrderedSet:v117];
    }
    uint64_t v82 = v135[5];
    if (!v82)
    {
      v83 = +[CSContactsWrapper sharedInstance];
      uint64_t v84 = [v83 CNContactEmailAddressesKeyString];
      v85 = (void *)v135[5];
      v135[5] = v84;

      uint64_t v82 = v135[5];
    }
    -[CSSearchableItem breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:](self, "breakOutPersonInformationInSet:withName:emails:contactIdentifiers:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:nameKey:emailKey:contactIdentifierKey:emailAddressKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:attributeSet:", v48, v74, v75, v76, v77, v121, v78, v79, v80, v81, v104, v105, v106, v82, v107,
      v109,
      v110,
      v108,
      v118);
  }
  _Block_object_dispose(&v134, 8);
}

- (void)_fixBrokenAuthorNames:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 authorNames];
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v14[0] = v4;
        v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
        [v3 setAuthorNames:v5];
      }
      else
      {
        v6 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          [(CSSearchableItem(Internal) *)(uint64_t)v4 _fixBrokenAuthorNames:&v12];
          v7 = v12;
        }
        else
        {
          v7 = @"kMDItemAuthors";
        }

        [v3 setAttribute:0 forKey:v7];
      }
    }
  }
  v8 = [v3 recipientNames];

  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v13 = v8;
        v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
        [v3 setRecipientNames:v9];
      }
      else
      {
        uint64_t v10 = logForCSLogCategoryIndex();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          [(CSSearchableItem(Internal) *)(uint64_t)v8 _fixBrokenAuthorNames:&v12];
          v11 = v12;
        }
        else
        {
          v11 = @"kMDItemRecipients";
        }

        [v3 setAttribute:0 forKey:v11];
      }
    }
  }
}

- (void)breakOutPersonInformationInSet:(id)a3 withName:(id)a4 emails:(id)a5 contactIdentifiers:(id)a6 photosPersonIdentifiers:(id)a7 personType:(id)a8 nameAlternatives:(id)a9 nameAlternativesCounts:(id)a10 faceAttributes:(id)a11 faceAttributesCounts:(id)a12 nameKey:(id)a13 emailKey:(id)a14 contactIdentifierKey:(id)a15 emailAddressKey:(id)a16 photosPersonIdentifierKey:(id)a17 personTypeKey:(id)a18 nameAlternativesKey:(id)a19 faceAttributesKey:(id)a20 attributeSet:(id)a21
{
  id v46 = a3;
  id v45 = a4;
  id v42 = a5;
  id v41 = a6;
  id v44 = a7;
  id v43 = a8;
  id v38 = a9;
  id v36 = a10;
  id v35 = a11;
  id v32 = a12;
  id v34 = a13;
  id v33 = a14;
  id v37 = a15;
  id v39 = a16;
  id v26 = a17;
  id v27 = a18;
  id v28 = a19;
  id v29 = a20;
  id v30 = a21;
  v31 = (void *)MEMORY[0x192F99810]();
  -[CSSearchableItem extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:](self, "extractAndStandardizePersonInformation:contactIdentifierKey:emailKey:nameKey:emailAddressExtractKey:photosPersonIdentifierKey:personTypeKey:nameAlternativesKey:faceAttributesKey:contactIdentifiers:emails:names:photosPersonIdentifiers:personType:nameAlternatives:nameAlternativesCounts:faceAttributes:faceAttributesCounts:persons:", v30, v37, v33, v34, v39, v26, v27, v28, v29, v41, v42, v45, v44, v43, v38,
    v36,
    v35,
    v32,
    v46);
}

void __70__CSSearchableItem_Internal__searchableItemFromUserActivity_bundleID___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) webpageURL];

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) webpageURL];
    v12 = [v11 absoluteString];
    v13 = [v12 dataUsingEncoding:10];
  }
  else
  {
    v13 = [v7 dataUsingEncoding:10];
  }
  v25[0] = 0;
  v25[1] = 0;
  id v14 = v13;
  MurmurHash3_128([v14 bytes], objc_msgSend(v14, "length"), 0, v25);
  v15 = [MEMORY[0x1E4F1C9B8] dataWithBytesNoCopy:v25 length:16 freeWhenDone:0];
  v16 = [v15 base64EncodedStringWithOptions:0];
  [*(id *)(a1 + 40) setUniqueIdentifier:v16];

  if (v7) {
    [*(id *)(a1 + 40) setAttribute:v7 forKey:@"_kMDItemUserActivityRequiredString"];
  }
  if (v8) {
    [*(id *)(a1 + 40) setAttribute:v8 forKey:@"_kMDItemUserActivitySecondaryString"];
  }
  if (v9) {
    [*(id *)(a1 + 40) setAttribute:v9 forKey:@"_kMDItemUserActivityData"];
  }
  uint64_t v17 = *(void **)(a1 + 40);
  v18 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  id v24 = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  [v17 setAttribute:v19 forKey:@":A:_kMDItemRankingLaunchDates"];

  v20 = *(void **)(a1 + 40);
  v21 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v20 setAttribute:v21 forKey:@"kMDItemLastUsedDate"];

  v22 = *(void **)(a1 + 40);
  v23 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  [v22 setAttribute:v23 forKey:@"kMDItemContentCreationDate"];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

- (CSSearchableItem)initWithAttributeSet:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSSearchableItem;
  v6 = [(CSSearchableItem *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributeSet, a3);
  }

  return v7;
}

- (unint64_t)hash
{
  v2 = [(CSSearchableItem *)self uniqueIdentifier];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)extractAndStandardizePersonInformation:(id)a3 contactIdentifierKey:(id)a4 emailKey:(id)a5 nameKey:(id)a6 emailAddressExtractKey:(id)a7 photosPersonIdentifierKey:(id)a8 personTypeKey:(id)a9 nameAlternativesKey:(id)a10 faceAttributesKey:(id)a11 contactIdentifiers:(id)a12 emails:(id)a13 names:(id)a14 photosPersonIdentifiers:(id)a15 personType:(id)a16 nameAlternatives:(id)a17 nameAlternativesCounts:(id)a18 faceAttributes:(id)a19 faceAttributesCounts:(id)a20 persons:(id)a21
{
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v104 = a3;
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v116 = a7;
  id v29 = a8;
  id v30 = a9;
  v31 = (__CFString *)a10;
  id v32 = a11;
  id v114 = a12;
  id v113 = a13;
  id v112 = a14;
  id v111 = a15;
  id v110 = a16;
  id v109 = a17;
  id v108 = a18;
  id v107 = a19;
  id v106 = a20;
  id v33 = a21;
  v145 = 0;
  v146 = 0;
  v102 = v27;
  id v103 = v26;
  v144[0] = v26;
  v144[1] = v27;
  v100 = v29;
  v101 = v28;
  v144[2] = v28;
  v144[3] = v29;
  v99 = v30;
  v144[4] = v30;
  v144[5] = v31;
  v144[6] = v32;
  if (@"kMDItemPhotosPeopleNamesAlternatives" == v31)
  {
    id v34 = MDItemPhotosPeopleNamesAlternativesCounts;
  }
  else
  {
    if (@"kMDItemPhotosSharedLibraryContributorsNames" != v31) {
      goto LABEL_6;
    }
    id v34 = MDItemPhotosSharedLibraryContributorsNamesAlternativesCounts;
  }
  v145 = *v34;
LABEL_6:
  v97 = v32;
  v98 = v31;
  if (v32) {
    v146 = @"kMDItemPhotosPeopleFaceAttributesCounts";
  }
  uint64_t v35 = 0;
  int v36 = 0;
  unsigned int v115 = 0;
  v143[0] = v114;
  v143[1] = v113;
  v143[2] = v112;
  void v143[3] = v111;
  v143[4] = v110;
  v143[5] = v109;
  v143[6] = v107;
  v143[7] = v108;
  v143[8] = v106;
  uint64_t v142 = 0;
  memset(v141, 0, sizeof(v141));
  uint64_t v140 = 0;
  memset(v139, 0, sizeof(v139));
  do
  {
    if (v144[v35])
    {
      v36 |= 1 << v35;
      uint64_t v37 = [(id)v143[v35] count];
      if (v37) {
        int v38 = 1 << v35;
      }
      else {
        int v38 = 0;
      }
      v115 |= v38;
    }
    else
    {
      uint64_t v37 = 0;
    }
    *((void *)v139 + v35) = v37;
    id v39 = (void *)*((void *)v141 + v35);
    *((void *)v141 + v35) = 0;

    ++v35;
  }
  while (v35 != 9);
  if (v33)
  {
    int v40 = v115;
    id v105 = v33;
    if ((unsigned __int16)v36 != (unsigned __int16)v115)
    {
      long long v130 = 0u;
      long long v131 = 0u;
      long long v128 = 0u;
      long long v129 = 0u;
      id v41 = v33;
      uint64_t v42 = [v41 countByEnumeratingWithState:&v128 objects:v138 count:16];
      if (!v42) {
        goto LABEL_70;
      }
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v129;
      uint64_t v120 = *(void *)v129;
      do
      {
        uint64_t v45 = 0;
        uint64_t v122 = v43;
        do
        {
          if (*(void *)v129 != v44) {
            objc_enumerationMutation(v41);
          }
          id v46 = *(void **)(*((void *)&v128 + 1) + 8 * v45);
          if ((v36 & 4) != 0 && (v40 & 4) == 0)
          {
            v47 = [*(id *)(*((void *)&v128 + 1) + 8 * v45) displayName];

            if (v47)
            {
              v48 = [v46 displayName];

              if (v48) {
                v40 |= 4u;
              }
            }
          }
          if ((v36 & 2) != 0 && v116 && (v40 & 2) == 0)
          {
            v49 = [v46 handles];
            uint64_t v50 = [v49 firstObject];
            if (v50)
            {
              v51 = (void *)v50;
              v52 = [v46 handleIdentifier];
              id v53 = v41;
              int v54 = [v52 isEqualToString:v116];

              id v33 = v105;
              BOOL v55 = v54 == 0;
              id v41 = v53;
              uint64_t v44 = v120;
              if (!v55) {
                v40 |= 2u;
              }
            }
            else
            {
            }
            uint64_t v43 = v122;
          }
          if ((v36 & 1) != 0 && (v40 & 1) == 0)
          {
            uint64_t v56 = [v46 contactIdentifier];
            BOOL v57 = v56 != 0;

            v40 |= v57;
          }
          if ((v36 & 8) != 0 && (v40 & 8) == 0)
          {
            uint64_t v58 = [v46 photosPersonIdentifier];

            if (v58) {
              v40 |= 8u;
            }
          }
          if ((v36 & 0x10) != 0 && (v40 & 0x10) == 0)
          {
            v59 = [v46 personType];

            if (v59) {
              v40 |= 0x10u;
            }
          }
          if ((v36 & 0x20) != 0 && (v40 & 0x20) == 0)
          {
            v60 = [v46 nameAlternatives];

            if (v60) {
              v40 |= 0x20u;
            }
          }
          if ((v36 & 0x80) != 0 && (v40 & 0x80) == 0)
          {
            v61 = [v46 nameAlternatives];

            if (v61) {
              v40 |= 0x80u;
            }
          }
          if ((v36 & 0x40) != 0 && (v40 & 0x40) == 0)
          {
            v62 = [v46 faceAttributes];

            if (v62) {
              v40 |= 0x40u;
            }
          }
          if ((v36 & 0x100) != 0 && (v40 & 0x100) == 0)
          {
            uint64_t v63 = [v46 faceAttributes];

            if (v63) {
              v40 |= 0x100u;
            }
          }
          if ((unsigned __int16)v40 == (unsigned __int16)v36)
          {
            int v40 = v36;
            goto LABEL_70;
          }
          ++v45;
        }
        while (v43 != v45);
        uint64_t v43 = [v41 countByEnumeratingWithState:&v128 objects:v138 count:16];
      }
      while (v43);
LABEL_70:
      unsigned int v115 = v40;
    }
    long long v126 = 0u;
    long long v127 = 0u;
    long long v124 = 0u;
    long long v125 = 0u;
    obuint64_t j = v33;
    uint64_t v123 = [obj countByEnumeratingWithState:&v124 objects:v137 count:16];
    if (!v123) {
      goto LABEL_144;
    }
    uint64_t v121 = *(void *)v125;
    int v64 = (v115 >> 1) & 1;
    if (!v116) {
      int v64 = 0;
    }
    int v119 = v64;
    char v118 = 1;
LABEL_75:
    uint64_t v65 = 0;
    while (1)
    {
      if (*(void *)v125 != v121) {
        objc_enumerationMutation(obj);
      }
      v66 = *(void **)(*((void *)&v124 + 1) + 8 * v65);
      uint64_t v136 = 0;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      if ((v115 & 4) != 0)
      {
        v68 = [v66 displayName];
        *(void *)&long long v133 = v68;

        BOOL v67 = v68 != 0;
      }
      else
      {
        BOOL v67 = 0;
      }
      if (!v119) {
        goto LABEL_85;
      }
      v69 = [v66 handles];
      uint64_t v70 = [v69 firstObject];
      *((void *)&v132 + 1) = v70;

      if (!v70) {
        goto LABEL_85;
      }
      v71 = [v66 handleIdentifier];
      char v72 = [v71 isEqualToString:v116];

      if (v72) {
        break;
      }
      *((void *)&v132 + 1) = 0;
      if ((v115 & 1) == 0)
      {
LABEL_86:
        if ((v115 & 8) == 0) {
          goto LABEL_87;
        }
        goto LABEL_98;
      }
LABEL_95:
      v73 = [v66 contactIdentifier];
      *(void *)&long long v132 = v73;

      if (v73) {
        BOOL v67 = 1;
      }
      if ((v115 & 8) == 0)
      {
LABEL_87:
        if ((v115 & 0x10) == 0) {
          goto LABEL_88;
        }
        goto LABEL_101;
      }
LABEL_98:
      v74 = [v66 photosPersonIdentifier];
      *((void *)&v133 + 1) = v74;

      if (v74) {
        BOOL v67 = 1;
      }
      if ((v115 & 0x10) == 0)
      {
LABEL_88:
        if ((v115 & 0x20) == 0) {
          goto LABEL_89;
        }
        goto LABEL_104;
      }
LABEL_101:
      v75 = [v66 personType];
      *(void *)&long long v134 = v75;

      if (v75) {
        BOOL v67 = 1;
      }
      if ((v115 & 0x20) == 0)
      {
LABEL_89:
        if ((v115 & 0x80) == 0) {
          goto LABEL_90;
        }
        goto LABEL_107;
      }
LABEL_104:
      v76 = [v66 nameAlternatives];
      *((void *)&v134 + 1) = v76;

      if (v76) {
        BOOL v67 = 1;
      }
      if ((v115 & 0x80) == 0)
      {
LABEL_90:
        if ((v115 & 0x40) == 0) {
          goto LABEL_91;
        }
        goto LABEL_110;
      }
LABEL_107:
      v77 = NSNumber;
      v78 = [v66 nameAlternatives];
      v79 = objc_msgSend(v77, "numberWithUnsignedInteger:", objc_msgSend(v78, "count"));
      *((void *)&v135 + 1) = v79;

      if (v79) {
        BOOL v67 = 1;
      }
      if ((v115 & 0x40) == 0)
      {
LABEL_91:
        if ((v115 & 0x100) == 0) {
          goto LABEL_92;
        }
        goto LABEL_113;
      }
LABEL_110:
      v80 = [v66 faceAttributes];
      *(void *)&long long v135 = v80;

      if (v80) {
        BOOL v67 = 1;
      }
      if ((v115 & 0x100) == 0)
      {
LABEL_92:
        if (v67) {
          goto LABEL_117;
        }
        goto LABEL_142;
      }
LABEL_113:
      v81 = NSNumber;
      uint64_t v82 = [v66 faceAttributes];
      v83 = objc_msgSend(v81, "numberWithUnsignedInteger:", objc_msgSend(v82, "count"));
      uint64_t v136 = v83;

      if (v83) {
        char v84 = 1;
      }
      else {
        char v84 = v67;
      }
      if (v84)
      {
LABEL_117:
        if (v118)
        {
          for (uint64_t i = 0; i != 9; ++i)
          {
            if (((unsigned __int16)v115 >> i))
            {
              if (*((void *)v139 + i)) {
                uint64_t v86 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithArray:v143[i]];
              }
              else {
                uint64_t v86 = objc_opt_new();
              }
              uint64_t v87 = (void *)*((void *)v141 + i);
              *((void *)v141 + i) = v86;
            }
          }
        }
        uint64_t v88 = 0;
        unsigned int v89 = -7;
        uint64_t v90 = MEMORY[0x1E4F1CBF0];
        do
        {
          if (((unsigned __int16)v115 >> (v89 + 7)))
          {
            if (v89 < 0xFFFFFFFE)
            {
              uint64_t v92 = *(void *)((char *)&v132 + v88);
              if (v89 > 1)
              {
                if (v92) {
                  v93 = *(__CFString **)((char *)&v132 + v88);
                }
                else {
                  v93 = &stru_1EDBB3A50;
                }
              }
              else if (v92)
              {
                v93 = *(__CFString **)((char *)&v132 + v88);
              }
              else
              {
                v93 = (__CFString *)&unk_1EDBD6520;
              }
              [*(id *)((char *)v141 + v88) addObject:v93];
            }
            else
            {
              if (*(void *)((char *)&v132 + v88)) {
                uint64_t v91 = *(void *)((char *)&v132 + v88);
              }
              else {
                uint64_t v91 = v90;
              }
              [*(id *)((char *)v141 + v88) addObjectsFromArray:v91];
            }
          }
          ++v89;
          v88 += 8;
        }
        while (v88 != 72);
        char v118 = 0;
      }
LABEL_142:
      if (++v65 == v123)
      {
        uint64_t v123 = [obj countByEnumeratingWithState:&v124 objects:v137 count:16];
        if (!v123)
        {
LABEL_144:

          v31 = v98;
          id v33 = v105;
          goto LABEL_145;
        }
        goto LABEL_75;
      }
    }
    BOOL v67 = 1;
LABEL_85:
    if ((v115 & 1) == 0) {
      goto LABEL_86;
    }
    goto LABEL_95;
  }
LABEL_145:
  for (uint64_t j = 0; j != 9; ++j)
  {
    if (((unsigned __int16)v115 >> j))
    {
      uint64_t v95 = *((void *)v141 + j);
      if (!v95) {
        uint64_t v95 = v143[j];
      }
      [v104 setAttribute:v95 forKey:v144[j]];
    }
  }
  for (uint64_t k = 64; k != -8; k -= 8)
}

- (void)_standardizeFileProvider:(id)a3
{
  v68[4] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 contentURL];
  if (![v4 isFileURL]) {
    goto LABEL_16;
  }
  id v5 = [v3 contentType];
  if ([v5 isEqualToString:*MEMORY[0x1E4F225C8]])
  {

    goto LABEL_16;
  }
  uint64_t v6 = [v3 documentIdentifier];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v3 fileProviderID];
    if ([v8 length])
    {
      objc_super v9 = [v3 fileItemID];
      uint64_t v10 = [v9 length];

      if (v10) {
        goto LABEL_16;
      }
      goto LABEL_10;
    }
  }
LABEL_10:
  if (objc_msgSend(v4, "cs_addDocumentTracking"))
  {
    uint64_t v11 = *MEMORY[0x1E4F1CDD0];
    uint64_t v12 = *MEMORY[0x1E4F1C6E8];
    v68[0] = *MEMORY[0x1E4F1CDD0];
    v68[1] = v12;
    uint64_t v13 = *MEMORY[0x1E4F1CEB0];
    uint64_t v14 = *MEMORY[0x1E4F1C550];
    v68[2] = *MEMORY[0x1E4F1CEB0];
    v68[3] = v14;
    v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:4];
    id v61 = 0;
    v16 = [v4 resourceValuesForKeys:v15 error:&v61];
    id v17 = v61;

    if (v17)
    {
      v18 = logForCSLogCategoryIndex();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        [(CSSearchableItem(Internal) *)(uint64_t)v4 _standardizeFileProvider:v18];
      }
    }
    else
    {
      v18 = [v16 objectForKeyedSubscript:v14];
      if (v18)
      {
        [v3 setDocumentIdentifier:v18];
        id v33 = [v16 objectForKeyedSubscript:v11];
        [v3 setFileIdentifier:v33];

        id v34 = [v16 objectForKeyedSubscript:v12];
        [v3 setFilename:v34];

        uint64_t v35 = [v16 objectForKeyedSubscript:v13];
        [v3 setParentFileIdentifier:v35];

        uint64_t v36 = [v3 fileProviderID];
        if (!v36
          || (uint64_t v37 = (void *)v36,
              [v3 fileItemID],
              int v38 = objc_claimAutoreleasedReturnValue(),
              v38,
              v37,
              !v38))
        {
          id v39 = +[CSFPItem itemWithFileURL:v4];
          int v40 = [v39 searchableItem];
          id v41 = [v40 attributeSet];

          uint64_t v42 = [v41 fileProviderID];
          uint64_t v43 = [v41 fileItemID];
          if ([v42 length] && objc_msgSend(v43, "length"))
          {
            v52 = v43;
            id v53 = v42;
            int v54 = v18;
            BOOL v55 = v16;
            uint64_t v56 = v4;
            uint64_t v44 = [v41 attributeDictionary];
            long long v57 = 0u;
            long long v58 = 0u;
            long long v59 = 0u;
            long long v60 = 0u;
            uint64_t v45 = [v44 countByEnumeratingWithState:&v57 objects:v67 count:16];
            if (v45)
            {
              uint64_t v46 = v45;
              uint64_t v47 = *(void *)v58;
              do
              {
                for (uint64_t i = 0; i != v46; ++i)
                {
                  if (*(void *)v58 != v47) {
                    objc_enumerationMutation(v44);
                  }
                  v49 = *(void **)(*((void *)&v57 + 1) + 8 * i);
                  if (([v49 isEqualToString:@"_kMDItemBundleID"] & 1) == 0
                    && ([v49 isEqualToString:@"_kMDItemExternalID"] & 1) == 0
                    && ([v49 isEqualToString:@"kMDItemContentTypeTree"] & 1) == 0)
                  {
                    if (![v49 isEqualToString:@"kMDItemContentType"]
                      || ([v3 contentType],
                          uint64_t v50 = objc_claimAutoreleasedReturnValue(),
                          v50,
                          !v50))
                    {
                      v51 = [v44 objectForKeyedSubscript:v49];
                      [v3 setAttribute:v51 forKey:v49];
                    }
                  }
                }
                uint64_t v46 = [v44 countByEnumeratingWithState:&v57 objects:v67 count:16];
              }
              while (v46);
            }
            [v3 setAttribute:MEMORY[0x1E4F1CC38] forKey:@"_kMDItemHasClientData"];

            v16 = v55;
            v4 = v56;
            v18 = v54;
            id v17 = 0;
            uint64_t v42 = v53;
            uint64_t v43 = v52;
          }
        }
      }
    }
  }
  else
  {
    [v3 setDocumentIdentifier:0];
    [v3 setParentFileIdentifier:0];
    [v3 setFileIdentifier:0];
    [v3 setFilename:0];
  }
LABEL_16:
  v19 = [v3 FPFilename];
  if (v19)
  {
    v20 = [v3 alternateNames];
    v21 = v20;
    if (v20)
    {
      [v20 arrayByAddingObject:v19];
    }
    else
    {
      v66 = v19;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v66 count:1];
    v22 = };
    [v3 setAlternateNames:v22];
  }
  char v23 = [v3 searchableItemFlags];
  uint64_t v24 = [v3 fileProviderID];
  id v25 = (void *)v24;
  if (v23)
  {
    if (v24)
    {
      id v29 = [v3 contentType];
      char v30 = [v29 isEqualToString:@"public.folder"];

      if ((v30 & 1) == 0
        && ([v25 isEqualToString:@"com.apple.FileProvider.LocalStorage"] & 1) == 0)
      {
        id v28 = [v3 attributeForKey:@"FPDownloaded"];
        if (([v28 BOOLValue] & 1) == 0)
        {
          [v3 setRequiresImport:MEMORY[0x1E4F1CC28]];
          [v3 setAttribute:*MEMORY[0x1E4F1D260] forKey:@"_kMDItemImportSandboxExtension"];
        }
        goto LABEL_39;
      }
    }
  }
  else if (v24)
  {
    id v26 = [v3 contentType];
    char v27 = [v26 isEqualToString:@"public.folder"];

    if ((v27 & 1) == 0)
    {
      if (![v25 isEqualToString:@"com.apple.FileProvider.LocalStorage"])
      {
        id v28 = [v3 attributeForKey:@"FPDownloaded"];
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          if ([v28 BOOLValue]) {
            v31 = "Downloaded";
          }
          else {
            v31 = "Cloudy";
          }
          id v32 = [v3 contentURL];
          *(_DWORD *)buf = 136315394;
          uint64_t v63 = v31;
          __int16 v64 = 2112;
          uint64_t v65 = v32;
          _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s file at %@", buf, 0x16u);
        }
        if ([v28 BOOLValue]) {
          [v3 setRequiresImport:MEMORY[0x1E4F1CC38]];
        }
        goto LABEL_39;
      }
      [v3 setRequiresImport:MEMORY[0x1E4F1CC38]];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        id v28 = [v3 contentURL];
        *(_DWORD *)buf = 138412290;
        uint64_t v63 = (const char *)v28;
        _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Local file at %@", buf, 0xCu);
LABEL_39:
      }
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(CSSearchableItem *)self attributeSet];
    id v7 = [v5 attributeSet];

    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setBundleID:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setBundleID:v4];
}

- (void)setIsUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CSSearchableItem *)self attributeSet];
  objc_msgSend(v4, "setSearchableItemFlags:", objc_msgSend(v4, "searchableItemFlags") & 0xFFFFFFFFFFFFFFFELL | v3);
}

- (void)setProtection:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setProtectionClass:v4];
}

- (void)setAttributeSet:(CSSearchableItemAttributeSet *)attributeSet
{
  id v4 = attributeSet;
  obuint64_t j = self;
  objc_sync_enter(obj);
  id v5 = obj->_attributeSet;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v7 = [(CSSearchableItemAttributeSet *)v5 searchableItemFlags];
    if (v7) {
      [(CSSearchableItemAttributeSet *)v4 setSearchableItemFlags:[(CSSearchableItemAttributeSet *)v4 searchableItemFlags] | v7];
    }
    char v8 = [(CSSearchableItemAttributeSet *)v4 uniqueIdentifier];

    if (!v8)
    {
      objc_super v9 = [(CSSearchableItemAttributeSet *)v6 uniqueIdentifier];
      if (v9) {
        [(CSSearchableItemAttributeSet *)v4 setUniqueIdentifier:v9];
      }
    }
    uint64_t v10 = [(CSSearchableItemAttributeSet *)v4 bundleID];

    if (!v10)
    {
      uint64_t v11 = [(CSSearchableItemAttributeSet *)v6 bundleID];
      if (v11) {
        [(CSSearchableItemAttributeSet *)v4 setBundleID:v11];
      }
    }
    uint64_t v12 = [(CSSearchableItemAttributeSet *)v4 domainIdentifier];

    if (!v12)
    {
      uint64_t v13 = [(CSSearchableItemAttributeSet *)v6 domainIdentifier];
      if (v13) {
        [(CSSearchableItemAttributeSet *)v4 setDomainIdentifier:v13];
      }
    }
    uint64_t v14 = [(CSSearchableItemAttributeSet *)v4 expirationDate];

    if (!v14)
    {
      v15 = [(CSSearchableItemAttributeSet *)v6 expirationDate];
      if (v15) {
        [(CSSearchableItemAttributeSet *)v4 setExpirationDate:v15];
      }
    }
  }
  v16 = obj->_attributeSet;
  obj->_attributeSet = v4;
  id v17 = v4;

  objc_sync_exit(obj);
}

- (NSString)bundleID
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 bundleID];

  return (NSString *)v3;
}

- (BOOL)_standardizeExternalAnalysisTags:(id)a3 forAttributeSet:(id)a4 primaryAttribute:(id)a5 analysisAttributes:(id)a6 specializedAttributes:(id)a7 standardizeBlock:(id)a8
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v68 = (uint64_t (**)(id, unint64_t, BOOL))a8;
  if ([v17 count] != 4) {
    -[CSSearchableItem(Internal) _standardizeExternalAnalysisTags:forAttributeSet:primaryAttribute:analysisAttributes:specializedAttributes:standardizeBlock:]();
  }
  if ([v14 count])
  {
    v66 = objc_opt_new();
    v62 = objc_opt_new();
    uint64_t v65 = objc_opt_new();
    __int16 v64 = objc_opt_new();
    if ([v14 count])
    {
      id v59 = v18;
      id v60 = v16;
      id v61 = v15;
      unint64_t v19 = 0;
      char v63 = 0;
      char v20 = 0;
      char v21 = 0;
      char v22 = 0;
      BOOL v67 = v14;
      do
      {
        char v23 = [v14 objectAtIndexedSubscript:v19];
        uint64_t v24 = [v23 label];
        uint64_t v25 = [v23 synonyms];
        [v23 confidence];
        double v27 = v26;
        BOOL v28 = v26 != 0.0;
        BOOL v29 = v26 != 0.0 || (v24 | v25) != 0;
        int v30 = v68[2](v68, v19, v29);
        if (v29 || v30)
        {
          if (v24) {
            v31 = (__CFString *)v24;
          }
          else {
            v31 = &stru_1EDBB3A50;
          }
          [v66 addObject:v31];
          id v32 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v25, "count"));
          [v65 addObject:v32];

          if (v25) {
            [v62 addObjectsFromArray:v25];
          }
          id v33 = [NSNumber numberWithDouble:v27];
          [v64 addObject:v33];

          char v63 = 1;
        }
        v22 |= v24 != 0;
        v21 |= v25 != 0;
        v20 |= v28;

        ++v19;
        id v14 = v67;
      }
      while (v19 < [v67 count]);
      if (v63)
      {
        id v16 = v60;
        id v18 = v59;
        if (v22)
        {
          if ([v66 count]) {
            id v34 = v66;
          }
          else {
            id v34 = 0;
          }
        }
        else
        {
          id v34 = 0;
        }
        uint64_t v50 = [v17 objectAtIndexedSubscript:0];
        [v61 setAttribute:v34 forKey:v50];

        if (v21)
        {
          v51 = v62;
          if (![v62 count]) {
            v51 = 0;
          }
          v52 = [v17 objectAtIndexedSubscript:1];
          [v61 setAttribute:v51 forKey:v52];

          id v53 = v65;
          if (![v65 count]) {
            id v53 = 0;
          }
        }
        else
        {
          int v54 = [v17 objectAtIndexedSubscript:1];
          [v61 setAttribute:0 forKey:v54];

          id v53 = 0;
        }
        id v15 = v61;
        BOOL v55 = [v17 objectAtIndexedSubscript:2];
        [v61 setAttribute:v53 forKey:v55];

        if (v20)
        {
          if ([v64 count]) {
            uint64_t v56 = v64;
          }
          else {
            uint64_t v56 = 0;
          }
        }
        else
        {
          uint64_t v56 = 0;
        }
        long long v57 = [v17 objectAtIndexedSubscript:3];
        [v61 setAttribute:v56 forKey:v57];

        BOOL v49 = 1;
      }
      else
      {
        BOOL v49 = 0;
        id v16 = v60;
        id v15 = v61;
        id v18 = v59;
      }
    }
    else
    {
      BOOL v49 = 0;
    }
    [v15 setAttribute:0 forKey:v16];
  }
  else if (-[CSSearchableItem isUpdate](self, "isUpdate") && [v15 attributeIsDelete:v16])
  {
    uint64_t v35 = v18;
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    id v36 = v17;
    id v37 = v17;
    uint64_t v38 = [v37 countByEnumeratingWithState:&v73 objects:v78 count:16];
    if (v38)
    {
      uint64_t v39 = v38;
      uint64_t v40 = *(void *)v74;
      uint64_t v41 = *MEMORY[0x1E4F1D260];
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v74 != v40) {
            objc_enumerationMutation(v37);
          }
          [v15 setAttribute:v41 forKey:*(void *)(*((void *)&v73 + 1) + 8 * i)];
        }
        uint64_t v39 = [v37 countByEnumeratingWithState:&v73 objects:v78 count:16];
      }
      while (v39);
    }

    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v18 = v35;
    id v43 = v35;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v69 objects:v77 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v70;
      uint64_t v47 = *MEMORY[0x1E4F1D260];
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v70 != v46) {
            objc_enumerationMutation(v43);
          }
          [v15 setAttribute:v47 forKey:*(void *)(*((void *)&v69 + 1) + 8 * j)];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v69 objects:v77 count:16];
      }
      while (v45);
    }

    BOOL v49 = 0;
    id v17 = v36;
  }
  else
  {
    BOOL v49 = 0;
  }

  return v49;
}

- (NSString)uniqueIdentifier
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 uniqueIdentifier];

  return (NSString *)v3;
}

- (BOOL)isUpdate
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 searchableItemFlags] & 1;

  return v3;
}

- (CSSearchableItem)initWithUniqueIdentifier:(NSString *)uniqueIdentifier domainIdentifier:(NSString *)domainIdentifier attributeSet:(CSSearchableItemAttributeSet *)attributeSet
{
  char v8 = uniqueIdentifier;
  objc_super v9 = domainIdentifier;
  uint64_t v10 = attributeSet;
  v18.receiver = self;
  v18.super_class = (Class)CSSearchableItem;
  uint64_t v11 = [(CSSearchableItem *)&v18 init];
  uint64_t v12 = v11;
  if (!v11) {
    goto LABEL_8;
  }
  if (v10)
  {
    [(CSSearchableItem *)v11 setAttributeSet:v10];
    if (v8) {
      goto LABEL_4;
    }
  }
  else
  {
    id v15 = objc_opt_new();
    [(CSSearchableItem *)v12 setAttributeSet:v15];

    if (v8)
    {
LABEL_4:
      [(CSSearchableItem *)v12 setUniqueIdentifier:v8];
      if (!v9) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  id v16 = [MEMORY[0x1E4F29128] UUID];
  id v17 = [v16 UUIDString];
  [(CSSearchableItem *)v12 setUniqueIdentifier:v17];

  if (v9) {
LABEL_5:
  }
    [(CSSearchableItem *)v12 setDomainIdentifier:v9];
LABEL_6:
  uint64_t v13 = [(CSSearchableItem *)v12 expirationDate];

  if (!v13) {
    [(CSSearchableItem *)v12 setExpirationDate:0];
  }
LABEL_8:

  return v12;
}

- (void)setExpirationDate:(NSDate *)expirationDate
{
  id v4 = expirationDate;
  if (!v4)
  {
    if (hasInternalCSEntitlement())
    {
      id v4 = 0;
    }
    else
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:(double)(86400 * ((uint64_t)(v5 + 2678400.0) / 86400))];
    }
  }
  uint64_t v7 = v4;
  uint64_t v6 = [(CSSearchableItem *)self attributeSet];
  [v6 setExpirationDate:v7];
}

- (void)setUniqueIdentifier:(NSString *)uniqueIdentifier
{
  id v4 = uniqueIdentifier;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setUniqueIdentifier:v4];
}

- (NSDate)expirationDate
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 expirationDate];

  return (NSDate *)v3;
}

- (void)setDomainIdentifier:(NSString *)domainIdentifier
{
  id v4 = domainIdentifier;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v5 setDomainIdentifier:v4];
}

- (BOOL)isAppEntity
{
  v2 = [(CSSearchableItem *)self attributeSet];
  unint64_t v3 = ((unint64_t)[v2 searchableItemFlags] >> 5) & 1;

  return v3;
}

- (void)standardizeAttributesForBundle:(id)a3 protectionClass:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  char v8 = [(CSSearchableItem *)self attributeSet];
  objc_super v9 = (void *)[v8 copy];

  uint64_t v10 = [v9 contentTypeTree];
  uint64_t v11 = [v10 count];

  if (!v11)
  {
    uint64_t v12 = [v9 contentType];
    uint64_t v13 = v12;
    if (v12)
    {
      if ([(__CFString *)v12 isEqualToString:@"public.item"])
      {
        if (standardizeAttributesForBundle_protectionClass__onceToken != -1) {
          dispatch_once(&standardizeAttributesForBundle_protectionClass__onceToken, &__block_literal_global_4);
        }
        [v9 setContentTypeTree:standardizeAttributesForBundle_protectionClass__sDefaultContentTypeTreeArray];
      }
      else if (([(__CFString *)v13 hasPrefix:@"dyn."] & 1) == 0)
      {
        id v14 = (__CFString *)MDCopyTypePedigree(v13);
        if ([(__CFString *)v14 count]) {
          [v9 setContentTypeTree:v14];
        }
      }
    }
  }
  [(CSSearchableItem *)self _standardizeFileProvider:v9];
  [(CSSearchableItem *)self _standardizePeople:v9];
  [(CSSearchableItem *)self _standardizeSceneClassification:v9];
  [(CSSearchableItem *)self _standardizeDocumentUnderstandingTopics:v9];
  [(CSSearchableItem *)self _standardizeDocumentUnderstandingCategories:v9];
  [(CSSearchableItem *)self _standardizeExtractedEntities:v9];
  [(CSSearchableItem *)self _standardizeExtractedNumericEntities:v9];
  [(CSSearchableItem *)self _standardizeDeprecatedProperties:v9];
  [(CSSearchableItem *)self _standardizeHTML:v9];
  [(CSSearchableItem *)self _standardizeMarkAs:v9];
  [(CSSearchableItem *)self _parseEmailHeadersForFeatures:v9];
  [(CSSearchableItem *)self _standardizeSiriShortcuts:v9];
  [(CSSearchableItem *)self _standardizePortrait:v9];
  id v15 = [v9 requiresImport];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    id v17 = [v9 contentURL];
    uint64_t v18 = [v17 fileSystemRepresentation];

    if (v18)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v19 = [v9 contentURL];
        *(_DWORD *)buf = 138412290;
        id v34 = v19;
        _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Attempt to read attributes from %@", buf, 0xCu);
      }
      char v20 = [v9 contentURL];
      char v21 = (void *)_MDItemCopyXattrsForURL();

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          char v22 = [v9 contentURL];
          *(_DWORD *)buf = 138412546;
          id v34 = v22;
          __int16 v35 = 2112;
          id v36 = v21;
          _os_log_impl(&dword_18D0E3000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Read attributes from %@: %@", buf, 0x16u);
        }
        [v9 addAttributesFromDictionaryWithOutOverWriting:v21];
      }
      char v23 = (void *)sandbox_extension_issue_file();
      if (v23)
      {
        uint64_t v24 = [NSString stringWithUTF8String:v23];
        [v9 setImportSandboxExtension:v24];
      }
      uint64_t v25 = [v9 contentType];

      if (!v25)
      {
        double v26 = [v9 contentURL];
        id v32 = 0;
        [v26 getResourceValue:&v32 forKey:*MEMORY[0x1E4F1C728] error:0];
        id v27 = v32;

        if (v27) {
          [v9 setContentType:v27];
        }
      }
      free(v23);
    }
  }
  uint64_t v28 = [(CSSearchableItem *)self bundleID];
  BOOL v29 = (void *)v28;
  if (v28) {
    int v30 = (void *)v28;
  }
  else {
    int v30 = v7;
  }
  id v31 = v30;

  objc_msgSend(v9, "_standardizeProcessorAttributesForBundle:protectionClass:isUpdate:", v31, v6, -[CSSearchableItem isUpdate](self, "isUpdate"));
  [(CSSearchableItem *)self setAttributeSet:v9];
}

- (void)_standardizePortrait:(id)a3
{
  id v6 = a3;
  unint64_t v3 = [v6 portraitNamedEntities];
  if ([v3 count])
  {
    id v4 = [v3 allKeys];
    id v5 = [v3 allValues];
    [v6 setAttribute:v4 forKey:@"_kMDItemPortraitNamedEntityArray"];
    [v6 setAttribute:v5 forKey:@"_kMDItemPortraitNamedEntityScoreArray"];
    [v6 setPortraitNamedEntities:0];
  }
}

- (void)_standardizeMarkAs:(id)a3
{
}

- (void)_standardizeDocumentUnderstandingTopics:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192F99810]();
  id v6 = (void *)MEMORY[0x1E4F1CAA0];
  id v7 = [v4 documentUnderstandingTopics];
  char v8 = [v6 orderedSetWithArray:v7];

  v10[0] = @"kMDItemDocumentUnderstandingTopicsLabels";
  v10[1] = @"kMDItemDocumentUnderstandingTopicsSynonyms";
  v10[2] = @"kMDItemDocumentUnderstandingTopicsSynonymsCounts";
  v10[3] = @"kMDItemDocumentUnderstandingTopicsConfidences";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v8 forAttributeSet:v4 primaryAttribute:@"kMDItemDocumentUnderstandingTopics" analysisAttributes:v9 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_217];
}

- (void)_standardizeDocumentUnderstandingCategories:(id)a3
{
  v10[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192F99810]();
  id v6 = (void *)MEMORY[0x1E4F1CAA0];
  id v7 = [v4 documentUnderstandingCategories];
  char v8 = [v6 orderedSetWithArray:v7];

  v10[0] = @"kMDItemDocumentUnderstandingCategoriesLabels";
  v10[1] = @"kMDItemDocumentUnderstandingCategoriesSynonyms";
  v10[2] = @"kMDItemDocumentUnderstandingCategoriesSynonymsCounts";
  v10[3] = @"kMDItemDocumentUnderstandingCategoriesConfidences";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v8 forAttributeSet:v4 primaryAttribute:@"kMDItemDocumentUnderstandingCategories" analysisAttributes:v9 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_219];
}

- (void)_parseEmailHeadersForFeatures:(id)a3
{
  id v3 = a3;
  id v4 = [v3 emailHeaders];

  if (!v4) {
    goto LABEL_17;
  }
  id v5 = [v3 emailHeaders];
  id v6 = [v5 objectForKey:@"Auto-submitted"];
  if (v6)
  {

LABEL_5:
    [v3 setAttribute:MEMORY[0x1E4F1CC38] forKey:@"kMDMailMessageAutoReplied"];
    goto LABEL_6;
  }
  id v7 = [v3 emailHeaders];
  char v8 = [v7 objectForKey:@"auto-submitted"];

  if (v8) {
    goto LABEL_5;
  }
LABEL_6:
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  BOOL v29 = __Block_byref_object_copy__2;
  int v30 = __Block_byref_object_dispose__2;
  id v31 = 0;
  objc_super v9 = [v3 emailHeaders];
  uint64_t v10 = [v9 objectForKey:@"List-Id"];
  uint64_t v11 = v10;
  if (v10)
  {
    id v31 = v10;
  }
  else
  {
    uint64_t v12 = [v3 emailHeaders];
    id v31 = [v12 objectForKey:@"list-id"];
  }
  if (v27[5])
  {
    uint64_t v13 = (void *)MEMORY[0x192F99810]();
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    char v22 = __60__CSSearchableItem_Internal___parseEmailHeadersForFeatures___block_invoke;
    char v23 = &unk_1E5549300;
    uint64_t v25 = &v26;
    id v14 = v3;
    id v24 = v14;
    id v15 = (void (**)(void *, void *, void *))_Block_copy(&v20);
    int v16 = objc_msgSend(v14, "attributeForKey:", @"kMDItemPrimaryRecipientEmailAddresses", v20, v21, v22, v23);
    id v17 = [v14 attributeForKey:@"kMDItemAdditionalRecipientEmailAddresses"];
    if ((unint64_t)[(id)v27[5] count] < 2
      || (unint64_t)[v16 count] <= 0xFF && (unint64_t)objc_msgSend(v17, "count") < 0x100)
    {
      v15[2](v15, v16, v17);
    }
    else
    {
      uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v16];
      unint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v17];
      v15[2](v15, v18, v19);
    }
  }
  _Block_object_dispose(&v26, 8);

LABEL_17:
}

- (void)_standardizeSiriShortcuts:(id)a3
{
  id v10 = a3;
  id v3 = [v10 contentType];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  id v4 = [v10 contentType];
  if (([v4 hasPrefix:@"com.apple.siri.interaction"] & 1) == 0)
  {
LABEL_9:

LABEL_10:
    char v8 = v10;
    goto LABEL_11;
  }
  id v5 = [v10 userActivityType];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  id v6 = [v10 userActivityType];
  int v7 = [v6 isEqualToString:@"/app/intents"];

  char v8 = v10;
  if (v7)
  {
    objc_super v9 = [v10 title];

    char v8 = v10;
    if (!v9)
    {
      id v3 = [v10 attributeForKey:@"kMDItemDisplayName"];
      if (v3)
      {
        [v10 setAttribute:v3 forKey:@"kMDItemTitle"];
        [v10 setAttribute:*MEMORY[0x1E4F1D260] forKey:@"kMDItemDisplayName"];
      }
      goto LABEL_10;
    }
  }
LABEL_11:
}

- (void)_standardizeSceneClassification:(id)a3
{
  v89[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192F99810]();
  id v5 = (void *)MEMORY[0x1E4F1CAA0];
  id v6 = [v4 photosSceneClassifications];
  int v7 = [v5 orderedSetWithArray:v6];

  uint64_t v82 = 0;
  v83 = &v82;
  uint64_t v84 = 0x3032000000;
  v85 = __Block_byref_object_copy__2;
  uint64_t v86 = __Block_byref_object_dispose__2;
  id v87 = 0;
  id v87 = (id)objc_opt_new();
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x3032000000;
  uint64_t v79 = __Block_byref_object_copy__2;
  v80 = __Block_byref_object_dispose__2;
  id v81 = 0;
  id v81 = (id)objc_opt_new();
  uint64_t v70 = 0;
  long long v71 = &v70;
  uint64_t v72 = 0x3032000000;
  long long v73 = __Block_byref_object_copy__2;
  long long v74 = __Block_byref_object_dispose__2;
  id v75 = 0;
  id v75 = (id)objc_opt_new();
  uint64_t v64 = 0;
  uint64_t v65 = &v64;
  uint64_t v66 = 0x3032000000;
  BOOL v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  id v69 = 0;
  id v69 = (id)objc_opt_new();
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = __Block_byref_object_copy__2;
  v62 = __Block_byref_object_dispose__2;
  id v63 = 0;
  id v63 = (id)objc_opt_new();
  uint64_t v52 = 0;
  id v53 = &v52;
  uint64_t v54 = 0x3032000000;
  BOOL v55 = __Block_byref_object_copy__2;
  uint64_t v56 = __Block_byref_object_dispose__2;
  id v57 = 0;
  id v57 = (id)objc_opt_new();
  uint64_t v48 = 0;
  BOOL v49 = &v48;
  uint64_t v50 = 0x2020000000;
  char v51 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x2020000000;
  char v47 = 0;
  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  uint64_t v36 = 0;
  uint64_t v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  v89[0] = @"kMDItemPhotosSceneClassificationLabels";
  v89[1] = @"kMDItemPhotosSceneClassificationSynonyms";
  v89[2] = @"kMDItemPhotosSceneClassificationSynonymsCounts";
  v89[3] = @"kMDItemPhotosSceneClassificationConfidences";
  char v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v89 count:4];
  v88[0] = @"kMDItemPhotosSceneClassificationIdentifiers";
  v88[1] = @"kMDItemPhotosSceneClassificationAreas";
  v88[2] = @"kMDItemPhotosSceneClassificationBoundingBoxes";
  v88[3] = @"kMDItemPhotosSceneClassificationTypedIdentifiers";
  v88[4] = @"kMDItemPhotosSceneClassificationTypes";
  v88[5] = @"kMDItemPhotosSceneClassificationMediaTypes";
  objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:6];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__CSSearchableItem_Internal___standardizeSceneClassification___block_invoke;
  v19[3] = &unk_1E5549348;
  id v10 = v7;
  id v20 = v10;
  uint64_t v21 = &v48;
  char v22 = &v40;
  char v23 = &v36;
  id v24 = &v32;
  uint64_t v25 = &v44;
  uint64_t v26 = &v82;
  id v27 = &v70;
  uint64_t v28 = &v64;
  BOOL v29 = &v58;
  int v30 = &v52;
  id v31 = &v76;
  BOOL v11 = [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v10 forAttributeSet:v4 primaryAttribute:@"kMDItemPhotosSceneClassification" analysisAttributes:v8 specializedAttributes:v9 standardizeBlock:v19];

  if (v11)
  {
    if (*((unsigned char *)v49 + 24) && [(id)v83[5] count]) {
      uint64_t v12 = v83[5];
    }
    else {
      uint64_t v12 = 0;
    }
    [v4 setAttribute:v12 forKey:@"kMDItemPhotosSceneClassificationIdentifiers"];
    if (*((unsigned char *)v45 + 24) && [(id)v77[5] count]) {
      uint64_t v13 = v77[5];
    }
    else {
      uint64_t v13 = 0;
    }
    [v4 setAttribute:v13 forKey:@"kMDItemPhotosSceneClassificationAreas"];
    if (*((unsigned char *)v41 + 24) && [(id)v71[5] count]) {
      uint64_t v14 = v71[5];
    }
    else {
      uint64_t v14 = 0;
    }
    [v4 setAttribute:v14 forKey:@"kMDItemPhotosSceneClassificationBoundingBoxes"];
    if (*((unsigned char *)v37 + 24) && [(id)v59[5] count]) {
      uint64_t v15 = v59[5];
    }
    else {
      uint64_t v15 = 0;
    }
    [v4 setAttribute:v15 forKey:@"kMDItemPhotosSceneClassificationTypes"];
    if (*((unsigned char *)v37 + 24) && [(id)v65[5] count]) {
      uint64_t v16 = v65[5];
    }
    else {
      uint64_t v16 = 0;
    }
    [v4 setAttribute:v16 forKey:@"kMDItemPhotosSceneClassificationTypedIdentifiers"];
    if (*((unsigned char *)v33 + 24) && [(id)v53[5] count]) {
      uint64_t v17 = v53[5];
    }
    else {
      uint64_t v17 = 0;
    }
    [v4 setAttribute:v17 forKey:@"kMDItemPhotosSceneClassificationMediaTypes"];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

  _Block_object_dispose(&v70, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v82, 8);
}

- (void)_standardizeExtractedNumericEntities:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x192F99810]();
  id v6 = (void *)MEMORY[0x1E4F1CAA0];
  int v7 = [v4 extractedDates];
  char v8 = [v6 orderedSetWithArray:v7];

  objc_super v9 = (void *)MEMORY[0x1E4F1CAA0];
  id v10 = [v4 extractedCurrencies];
  BOOL v11 = [v9 orderedSetWithArray:v10];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v13 = [v4 extractedLocations];
  uint64_t v14 = [v12 orderedSetWithArray:v13];

  if (![(CSSearchableItem *)self _standardizeNumericAnalysisTags:v8 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedDates" analysisAttributes:&unk_1EDBD5BC0 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_267])
  {
    uint64_t v15 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableItem(Internal) _standardizeExtractedNumericEntities:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  if (![(CSSearchableItem *)self _standardizeNumericAnalysisTags:v11 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedCurrencies" analysisAttributes:&unk_1EDBD5BD8 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_276])
  {
    char v23 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableItem(Internal) _standardizeExtractedNumericEntities:](v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  if (![(CSSearchableItem *)self _standardizeNumericAnalysisTags:v14 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedLocations" analysisAttributes:&unk_1EDBD5BF0 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_288])
  {
    id v31 = logForCSLogCategoryDefault();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[CSSearchableItem(Internal) _standardizeExtractedNumericEntities:](v31, v32, v33, v34, v35, v36, v37, v38);
    }
  }
}

- (BOOL)_standardizeNumericAnalysisTags:(id)a3 forAttributeSet:(id)a4 primaryAttribute:(id)a5 analysisAttributes:(id)a6 specializedAttributes:(id)a7 standardizeBlock:(id)a8
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v70 = a6;
  id v17 = a7;
  uint64_t v18 = v14;
  id v19 = v17;
  id v69 = (uint64_t (**)(id, unint64_t, BOOL))a8;
  uint64_t v20 = [NSString stringWithFormat:@"_%@Values", v16];
  uint64_t v21 = [NSString stringWithFormat:@"_%@Confidences", v16];
  if ([v18 count])
  {
    id v22 = (id)objc_opt_new();
    v68 = objc_opt_new();
    char v23 = objc_opt_new();
    uint64_t v24 = objc_opt_new();
    if ([v18 count])
    {
      uint64_t v66 = v24;
      BOOL v67 = v23;
      v62 = v21;
      uint64_t v64 = v20;
      id v60 = v19;
      id v61 = v16;
      unint64_t v25 = 0;
      char v26 = 0;
      do
      {
        while (1)
        {
          uint64_t v27 = [v18 objectAtIndexedSubscript:v25];
          uint64_t v28 = [v27 primaryValue];
          [v27 confidence];
          double v30 = v29;
          id v31 = [v27 components];
          uint64_t v32 = [v31 count];
          if (v32 != [v70 count])
          {

            LOBYTE(v31) = 0;
            id v19 = v60;
            id v16 = v61;
            uint64_t v20 = v64;
            uint64_t v24 = v66;
            char v23 = v67;
            goto LABEL_53;
          }
          BOOL v33 = v30 == 0.0 && v31 == 0;
          BOOL v34 = !v33;
          int v35 = v69[2](v69, v25, v34);
          if (!v34 && !v35) {
            break;
          }
          id v59 = v18;
          if ([v31 count])
          {
            unint64_t v36 = 0;
            do
            {
              if (!v25)
              {
                uint64_t v37 = [v70 objectAtIndexedSubscript:v36];
                [v68 addObject:v37];
                uint64_t v38 = [MEMORY[0x1E4F1CA48] array];
                [v22 addObject:v38];
              }
              char v39 = [v31 objectAtIndexedSubscript:v36];
              uint64_t v40 = [v22 objectAtIndexedSubscript:v36];
              [v40 addObject:v39];

              ++v36;
            }
            while (v36 < [v31 count]);
          }
          uint64_t v41 = [NSNumber numberWithDouble:v30];
          [v67 addObject:v41];

          [v66 addObject:v28];
          ++v25;
          uint64_t v18 = v59;
          char v26 = 1;
          if (v25 >= [v59 count]) {
            goto LABEL_43;
          }
        }

        ++v25;
      }
      while (v25 < [v18 count]);
      if ((v26 & 1) == 0)
      {
        LOBYTE(v31) = 0;
        id v19 = v60;
        id v16 = v61;
        uint64_t v20 = v64;
        uint64_t v24 = v66;
        char v23 = v67;
        goto LABEL_52;
      }
LABEL_43:
      uint64_t v50 = v18;
      long long v81 = 0u;
      long long v82 = 0u;
      long long v79 = 0u;
      long long v80 = 0u;
      id v31 = v68;
      uint64_t v51 = [v31 countByEnumeratingWithState:&v79 objects:v85 count:16];
      if (v51)
      {
        uint64_t v52 = v51;
        uint64_t v53 = 0;
        uint64_t v54 = *(void *)v80;
        do
        {
          for (uint64_t i = 0; i != v52; ++i)
          {
            if (*(void *)v80 != v54) {
              objc_enumerationMutation(v31);
            }
            uint64_t v56 = *(void *)(*((void *)&v79 + 1) + 8 * i);
            id v57 = [v22 objectAtIndexedSubscript:v53 + i];
            [v15 setAttribute:v57 forKey:v56];
          }
          uint64_t v52 = [v31 countByEnumeratingWithState:&v79 objects:v85 count:16];
          v53 += i;
        }
        while (v52);
      }

      char v23 = v67;
      uint64_t v21 = v62;
      [v15 setAttribute:v67 forKey:v62];
      uint64_t v20 = v64;
      uint64_t v24 = v66;
      [v15 setAttribute:v66 forKey:v64];
      LOBYTE(v31) = 1;
      uint64_t v18 = v50;
      id v19 = v60;
      id v16 = v61;
    }
    else
    {
      LOBYTE(v31) = 0;
    }
LABEL_52:
    [v15 setAttribute:0 forKey:v16];
LABEL_53:

    goto LABEL_54;
  }
  if (-[CSSearchableItem isUpdate](self, "isUpdate") && [v15 attributeIsDelete:v16])
  {
    uint64_t v65 = v20;
    uint64_t v42 = *MEMORY[0x1E4F1D260];
    id v63 = v21;
    [v15 setAttribute:*MEMORY[0x1E4F1D260] forKey:v21];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v43 = v70;
    uint64_t v44 = [v43 countByEnumeratingWithState:&v75 objects:v84 count:16];
    if (v44)
    {
      uint64_t v45 = v44;
      uint64_t v46 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v45; ++j)
        {
          if (*(void *)v76 != v46) {
            objc_enumerationMutation(v43);
          }
          [v15 setAttribute:v42 forKey:*(void *)(*((void *)&v75 + 1) + 8 * j)];
        }
        uint64_t v45 = [v43 countByEnumeratingWithState:&v75 objects:v84 count:16];
      }
      while (v45);
    }

    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
    id v22 = v19;
    id v31 = (id)[v22 countByEnumeratingWithState:&v71 objects:v83 count:16];
    if (v31)
    {
      uint64_t v48 = *(void *)v72;
      do
      {
        for (uint64_t k = 0; k != v31; uint64_t k = (char *)k + 1)
        {
          if (*(void *)v72 != v48) {
            objc_enumerationMutation(v22);
          }
          [v15 setAttribute:v42 forKey:*(void *)(*((void *)&v71 + 1) + 8 * (void)k)];
        }
        id v31 = (id)[v22 countByEnumeratingWithState:&v71 objects:v83 count:16];
      }
      while (v31);
    }
    uint64_t v21 = v63;
    uint64_t v20 = v65;
LABEL_54:

    goto LABEL_55;
  }
  LOBYTE(v31) = 1;
LABEL_55:

  return (char)v31;
}

- (void)_standardizeExtractedEntities:(id)a3
{
  v49[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x192F99810]();
  id v5 = (void *)MEMORY[0x1E4F1CAA0];
  id v6 = [v4 extractedEmails];
  BOOL v33 = [v5 orderedSetWithArray:v6];

  int v7 = (void *)MEMORY[0x1E4F1CAA0];
  char v8 = [v4 extractedPhoneNumbers];
  objc_super v9 = [v7 orderedSetWithArray:v8];

  id v10 = (void *)MEMORY[0x1E4F1CAA0];
  BOOL v11 = [v4 extractedAddresses];
  uint64_t v32 = [v10 orderedSetWithArray:v11];

  uint64_t v12 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v13 = [v4 extractedTrackingNumbers];
  id v31 = [v12 orderedSetWithArray:v13];

  id v14 = (void *)MEMORY[0x1E4F1CAA0];
  id v15 = [v4 extractedFlights];
  id v16 = [v14 orderedSetWithArray:v15];

  id v17 = (void *)MEMORY[0x1E4F1CAA0];
  uint64_t v18 = [v4 extractedLinks];
  id v19 = [v17 orderedSetWithArray:v18];

  v49[0] = @"kMDItemExtractedEmailsLabels";
  v49[1] = @"kMDItemExtractedEmailsSynonyms";
  v49[2] = @"kMDItemExtractedEmailsSynonymsCounts";
  v49[3] = @"kMDItemExtractedEmailsConfidences";
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v33 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedEmails" analysisAttributes:v20 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_224];

  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__2;
  uint64_t v41 = __Block_byref_object_dispose__2;
  id v42 = 0;
  id v42 = (id)objc_opt_new();
  v48[0] = @"kMDItemExtractedPhoneNumbersLabels";
  v48[1] = @"kMDItemExtractedPhoneNumbersSynonyms";
  v48[2] = @"kMDItemExtractedPhoneNumbersSynonymsCounts";
  v48[3] = @"kMDItemExtractedPhoneNumbersConfidences";
  uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:4];
  char v47 = @"kMDItemExtractedPhoneNumbersCountryCodes";
  id v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke_2;
  v34[3] = &unk_1E5549370;
  id v23 = v9;
  id v35 = v23;
  unint64_t v36 = &v37;
  BOOL v24 = [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v23 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedPhoneNumbers" analysisAttributes:v21 specializedAttributes:v22 standardizeBlock:v34];

  if (v24)
  {
    if ([(id)v38[5] count]) {
      uint64_t v25 = v38[5];
    }
    else {
      uint64_t v25 = 0;
    }
    [v4 setAttribute:v25 forKey:@"kMDItemExtractedPhoneNumbersCountryCodes"];
  }
  v46[0] = @"kMDItemExtractedAddressesLabels";
  v46[1] = @"kMDItemExtractedAddressesSynonyms";
  v46[2] = @"kMDItemExtractedAddressesSynonymsCounts";
  v46[3] = @"kMDItemExtractedAddressesConfidences";
  char v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v32 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedAddresses" analysisAttributes:v26 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_226];

  v45[0] = @"kMDItemExtractedTrackingNumbersLabels";
  v45[1] = @"kMDItemExtractedTrackingNumbersSynonyms";
  v45[2] = @"kMDItemExtractedTrackingNumbersSynonymsCounts";
  v45[3] = @"kMDItemExtractedTrackingNumbersConfidences";
  uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v31 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedTrackingNumbers" analysisAttributes:v27 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_228];

  v44[0] = @"kMDItemExtractedFlightsLabels";
  v44[1] = @"kMDItemExtractedFlightsSynonyms";
  v44[2] = @"kMDItemExtractedFlightsSynonymsCounts";
  v44[3] = @"kMDItemExtractedFlightsConfidences";
  uint64_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v16 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedFlights" analysisAttributes:v28 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_230];

  v43[0] = @"kMDItemExtractedLinksLabels";
  v43[1] = @"kMDItemExtractedLinksSynonyms";
  v43[2] = @"kMDItemExtractedLinksSynonymsCounts";
  v43[3] = @"kMDItemExtractedLinksConfidences";
  double v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:4];
  [(CSSearchableItem *)self _standardizeExternalAnalysisTags:v19 forAttributeSet:v4 primaryAttribute:@"kMDItemExtractedLinks" analysisAttributes:v29 specializedAttributes:MEMORY[0x1E4F1CBF0] standardizeBlock:&__block_literal_global_232];

  _Block_object_dispose(&v37, 8);
}

- (void)_standardizeHTML:(id)a3
{
  id v11 = a3;
  id v3 = [v11 attributeForKey:@"kMDItemHTMLContent"];
  if (v3)
  {
    id v4 = [v11 HTMLContentData];

    if (!v4)
    {
      id v5 = [v3 dataUsingEncoding:4];
      [v11 setHTMLContentData:v5];
    }
    [v11 setAttribute:0 forKey:@"kMDItemHTMLContent"];
  }
  id v6 = [v11 textContent];

  if (!v6)
  {
    int v7 = [v11 HTMLContentData];
    if ([v7 length])
    {
      unint64_t v8 = [v7 length];
      if (v8 >= 0xC350) {
        unint64_t v9 = 50000;
      }
      else {
        unint64_t v9 = v8;
      }
      id v10 = _MDPlainTextFromHTMLData(v7, v9, 0, 4);
      if ([v10 length]) {
        [v11 setTextContent:v10];
      }
    }
  }
}

- (void)setIsAppEntity:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CSSearchableItem *)self attributeSet];
  unint64_t v4 = [v6 searchableItemFlags] & 0xFFFFFFFFFFFFFFDFLL;
  uint64_t v5 = 32;
  if (!v3) {
    uint64_t v5 = 0;
  }
  [v6 setSearchableItemFlags:v4 | v5];
}

- (NSString)domainIdentifier
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 domainIdentifier];

  return (NSString *)v3;
}

- (NSString)protection
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 protectionClass];

  return (NSString *)v3;
}

+ (id)searchableItemFromUserActivity:(id)a3 bundleID:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_opt_new();
  [v7 setContentType:*MEMORY[0x1E4F22608]];
  unint64_t v8 = [v5 activityType];
  [v7 setUserActivityType:v8];

  unint64_t v9 = [v5 title];

  if (v9)
  {
    id v10 = [v5 title];
    [v7 setDisplayName:v10];

    id v11 = [v5 title];
    [v7 setTitle:v11];
  }
  uint64_t v12 = [v5 webpageURL];

  if (v12)
  {
    uint64_t v13 = [v5 webpageURL];
    [v7 setContentURL:v13];
  }
  id v14 = [v5 keywords];

  if (v14)
  {
    id v15 = [v5 keywords];
    id v16 = [v15 allObjects];
    [v7 setKeywords:v16];
  }
  if (objc_opt_respondsToSelector())
  {
    id v17 = [v5 performSelector:sel_suggestedInvocationPhrase];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v7 setSuggestedInvocationPhrase:v17];
    }
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [v5 performSelector:sel_shortcutAvailability];
    id v19 = [NSNumber numberWithUnsignedLong:v18];
    [v7 setShortcutAvailability:v19];
  }
  uint64_t v20 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isEligibleForPublicIndexing"));
  [v7 setAttribute:v20 forKey:@"_kMDItemUserActivityEligibleForPublicIndexing"];

  uint64_t v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v5, "isEligibleForSearch"));
  [v7 setAttribute:v21 forKey:@"_kMDItemUserActivityEligibleForSearch"];

  id v22 = [v5 contentAttributeSet];
  [v7 addAttributesFromAttributeSet:v22];
  id v23 = dispatch_group_create();
  dispatch_group_enter(v23);
  uint64_t v48 = MEMORY[0x1E4F143A8];
  uint64_t v49 = 3221225472;
  uint64_t v50 = __70__CSSearchableItem_Internal__searchableItemFromUserActivity_bundleID___block_invoke;
  uint64_t v51 = &unk_1E55492D8;
  id v24 = v5;
  id v52 = v24;
  id v25 = v7;
  id v53 = v25;
  char v26 = v23;
  uint64_t v54 = v26;
  if (([v24 _createUserActivityStringsWithOptions:0 completionHandler:&v48] & 1) == 0) {
    dispatch_group_leave(v26);
  }
  dispatch_group_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v27 = [v24 performSelector:sel_persistentIdentifier];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v27 length])
    {
      uint64_t v28 = [@"NSUA:" stringByAppendingString:v27];
      [v25 setUniqueIdentifier:v28];
    }
  }
  BOOL v29 = +[CSSearchableIndex activityShouldBeIndexed:v24 bundleID:v6];
  BOOL v30 = v29;
  if (v6)
  {
    if (v29)
    {
      id v31 = +[CSSearchableIndex mainBundleID];
      int v32 = [v31 isEqualToString:v6];

      if (v32)
      {
        BOOL v33 = +[CSSearchableIndex mainBundleLocalizedString];
        if (v33) {
          [v25 setApplicationName:v33];
        }
      }
    }
  }
  BOOL v34 = [[CSSearchableItem alloc] initWithAttributeSet:v25];
  id v35 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:2592000.0];
  [(CSSearchableItem *)v34 setExpirationDate:v35];

  if (!v30) {
    [(CSSearchableItem *)v34 setNoIndex:1];
  }
  unint64_t v36 = logForCSLogCategoryDefault();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    uint64_t v37 = [(CSSearchableItem *)v34 uniqueIdentifier];
    id v46 = v24;
    uint64_t v38 = v26;
    id v39 = v25;
    uint64_t v40 = v22;
    id v41 = v6;
    if (v30) {
      id v42 = @"YES";
    }
    else {
      id v42 = @"NO";
    }
    id v43 = [(CSSearchableItem *)v34 attributeSet];
    uint64_t v44 = [v43 userActivityType];
    *(_DWORD *)buf = 138413058;
    uint64_t v56 = v37;
    __int16 v57 = 2112;
    uint64_t v58 = v42;
    id v6 = v41;
    id v22 = v40;
    id v25 = v39;
    char v26 = v38;
    id v24 = v47;
    __int16 v59 = 2112;
    id v60 = v44;
    __int16 v61 = 2112;
    id v62 = v6;
    _os_log_impl(&dword_18D0E3000, v36, OS_LOG_TYPE_INFO, "Created UA item, identifier:%@, shouldIndex:%@, userActivityType:%@, bundleID:%@", buf, 0x2Au);
  }

  return v34;
}

void __60__CSSearchableItem_Internal___parseEmailHeadersForFeatures___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v26 = a2;
  uint64_t v24 = a1;
  id v25 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v29 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v29)
  {
    int v5 = 0;
    int v6 = 0;
    uint64_t v28 = *(void *)v31;
    id v23 = @"kMDMailMessageHasDistributionListInCC";
    uint64_t v7 = MEMORY[0x1E4F14390];
LABEL_3:
    uint64_t v8 = 0;
LABEL_4:
    if (*(void *)v31 != v28) {
      objc_enumerationMutation(obj);
    }
    if ((v6 & v5 & 1) == 0)
    {
      unint64_t v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
      uint64_t v10 = [v9 length];
      if (!v10) {
        goto LABEL_38;
      }
      uint64_t v11 = v10;
      unint64_t v12 = 0;
      unint64_t v13 = 0;
      while (1)
      {
        unsigned int v14 = objc_msgSend(v9, "characterAtIndex:", v12, v23);
        unsigned int v15 = v14;
        if (v14 > 0x7F)
        {
          if (__maskrune(v14, 0x4000uLL)) {
            goto LABEL_14;
          }
        }
        else if ((*(_DWORD *)(v7 + 4 * v14 + 60) & 0x4000) != 0)
        {
          goto LABEL_14;
        }
        unint64_t v13 = v12;
        if (v15 == 60)
        {
          if (v11 - 1 <= v12)
          {
            unint64_t v16 = 0;
            goto LABEL_16;
          }
          unint64_t v18 = 0;
          unint64_t v16 = v11 - 2;
          while (2)
          {
            unsigned int v19 = [v9 characterAtIndex:v16 + 1];
            unsigned int v20 = v19;
            if (v19 > 0x7F)
            {
              if (!__maskrune(v19, 0x4000uLL)) {
                goto LABEL_28;
              }
              goto LABEL_29;
            }
            if ((*(_DWORD *)(v7 + 4 * v19 + 60) & 0x4000) != 0) {
              goto LABEL_29;
            }
LABEL_28:
            unint64_t v18 = v16 + 1;
            if (v20 != 62)
            {
LABEL_29:
              if (v16-- <= v12)
              {
                unint64_t v16 = v18;
                goto LABEL_16;
              }
              continue;
            }
            break;
          }
          ++v12;
LABEL_16:
          if ((uint64_t)v16 > (uint64_t)v12)
          {
            id v17 = objc_msgSend(v9, "substringWithRange:", v12, v16 - v12 + 1);
            if (v6) {
              goto LABEL_20;
            }
            if ([v26 containsObject:v17])
            {
              [*(id *)(v24 + 32) setAttribute:MEMORY[0x1E4F1CC38] forKey:@"kMDMailMessageHasDistributionListInTo"];
LABEL_20:
              int v6 = 1;
              if (v5)
              {
LABEL_35:
                int v5 = 1;
                goto LABEL_37;
              }
            }
            else
            {
              int v6 = 0;
              if (v5) {
                goto LABEL_35;
              }
            }
            if ([v25 containsObject:v17])
            {
              [*(id *)(v24 + 32) setAttribute:MEMORY[0x1E4F1CC38] forKey:v23];
              goto LABEL_35;
            }
            int v5 = 0;
LABEL_37:
          }
LABEL_38:
          if (++v8 == v29)
          {
            uint64_t v22 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
            uint64_t v29 = v22;
            if (!v22) {
              break;
            }
            goto LABEL_3;
          }
          goto LABEL_4;
        }
LABEL_14:
        if (v11 == ++v12)
        {
          unint64_t v16 = 0;
          unint64_t v12 = v13;
          goto LABEL_16;
        }
      }
    }
  }
}

void __77__CSSearchableItem_Internal__standardizeAttributesForBundle_protectionClass___block_invoke()
{
  v0 = (void *)standardizeAttributesForBundle_protectionClass__sDefaultContentTypeTreeArray;
  standardizeAttributesForBundle_protectionClass__sDefaultContentTypeTreeArray = (uint64_t)&unk_1EDBD5BA8;
}

- (CSSearchableItem)init
{
  v7.receiver = self;
  v7.super_class = (Class)CSSearchableItem;
  v2 = [(CSSearchableItem *)&v7 init];
  if (v2)
  {
    BOOL v3 = objc_opt_new();
    [(CSSearchableItem *)v2 setAttributeSet:v3];

    unint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    int v5 = [v4 UUIDString];
    [(CSSearchableItem *)v2 setUniqueIdentifier:v5];

    [(CSSearchableItem *)v2 setExpirationDate:0];
  }
  return v2;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(CSSearchableItem *)self attributeSet];
  [v4 encodeObject:v5 forKey:@"attributes"];
}

- (CSSearchableItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSSearchableItem;
  id v5 = [(CSSearchableItem *)&v10 init];
  if (v5)
  {
    int v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"attributes"];
    [(CSSearchableItem *)v5 setAttributeSet:v6];

    objc_super v7 = [(CSSearchableItem *)v5 attributeSet];

    if (!v7)
    {
      uint64_t v8 = objc_opt_new();
      [(CSSearchableItem *)v5 setAttributeSet:v8];
    }
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  id v5 = [(CSSearchableItem *)self attributeSet];
  int v6 = (void *)[v5 copy];
  [v4 setAttributeSet:v6];

  objc_super v7 = [(CSSearchableItem *)self uniqueIdentifier];
  [v4 setUniqueIdentifier:v7];

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)compareByEmbeddingDistance:(id)a3
{
  id v4 = a3;
  if (![(CSSearchableItem *)self isEqual:v4])
  {
    int v6 = [(CSSearchableItem *)self bundleID];
    objc_super v7 = [v4 bundleID];
    int64_t v5 = [v6 compare:v7];

    if (v5) {
      goto LABEL_25;
    }
    uint64_t v8 = [(CSSearchableItem *)self attributeSet];
    unint64_t v9 = [v8 attributeDictionary];
    objc_super v10 = [v9 objectForKey:@"kMDQueryResultRetrievalType"];

    uint64_t v11 = [v4 attributeSet];
    unint64_t v12 = [v11 attributeDictionary];
    unint64_t v13 = [v12 objectForKey:@"kMDQueryResultRetrievalType"];

    if ((int)[v10 intValue] < 2 || (int)objc_msgSend(v13, "intValue") < 2)
    {
      int64_t v5 = 0;
LABEL_24:

      goto LABEL_25;
    }
    unsigned int v14 = [(CSSearchableItem *)self attributeSet];
    unsigned int v15 = [v14 attributeDictionary];
    unint64_t v16 = [v15 objectForKey:@"kMDQueryResultEmbeddingDistances"];

    id v17 = [v4 attributeSet];
    unint64_t v18 = [v17 attributeDictionary];
    unsigned int v19 = [v18 objectForKey:@"kMDQueryResultEmbeddingDistances"];

    if ([v16 count] == 3)
    {
      unsigned int v20 = [v16 objectAtIndexedSubscript:0];
      [v20 floatValue];
      BOOL v22 = v21 != 3.4028e38;
    }
    else
    {
      BOOL v22 = 0;
    }
    if ([v19 count] == 3)
    {
      id v23 = [v19 objectAtIndexedSubscript:0];
      [v23 floatValue];
      float v25 = v24;

      char v26 = !v22;
      if (v25 == 3.4028e38) {
        char v26 = 1;
      }
      if ((v26 & 1) == 0)
      {
        uint64_t v27 = [v16 objectAtIndexedSubscript:0];
        [v27 floatValue];
        float v29 = v28;
        long long v30 = [v19 objectAtIndexedSubscript:0];
        [v30 floatValue];
        if (v29 >= v31) {
          int64_t v5 = 1;
        }
        else {
          int64_t v5 = -1;
        }

        goto LABEL_23;
      }
      BOOL v32 = v25 != 3.4028e38;
    }
    else
    {
      BOOL v32 = 0;
    }
    if (v22) {
      int64_t v5 = -1;
    }
    else {
      int64_t v5 = v32;
    }
LABEL_23:

    goto LABEL_24;
  }
  int64_t v5 = 0;
LABEL_25:

  return v5;
}

- (NSComparisonResult)compareByRank:(CSSearchableItem *)other
{
  id v4 = other;
  if (![(CSSearchableItem *)self isEqual:v4])
  {
    int v6 = [(CSSearchableItem *)self bundleID];
    objc_super v7 = [(CSSearchableItem *)v4 bundleID];
    NSComparisonResult v5 = [v6 compare:v7];

    if (v5) {
      goto LABEL_59;
    }
    uint64_t v8 = [(CSSearchableItem *)self attributeSet];
    unint64_t v9 = [v8 attributeDictionary];
    objc_super v10 = [v9 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];

    uint64_t v11 = [(CSSearchableItem *)v4 attributeSet];
    unint64_t v12 = [v11 attributeDictionary];
    unint64_t v13 = [v12 objectForKeyedSubscript:@"kMDQueryResultScoreL2"];

    [v10 floatValue];
    float v15 = v14;
    [v13 floatValue];
    if (v15 == 0.0 || v16 == 0.0)
    {
      BOOL v23 = v16 == 0.0 || v15 != 0.0;
      if (v23) {
        NSComparisonResult v5 = NSOrderedAscending;
      }
      else {
        NSComparisonResult v5 = NSOrderedDescending;
      }
      if (v15 != 0.0 || !v23) {
        goto LABEL_58;
      }
    }
    else
    {
      [v10 floatValue];
      float v18 = v17;
      [v13 floatValue];
      if (v18 != v19)
      {
        [v10 floatValue];
        float v21 = v20;
        [v13 floatValue];
        if (v21 <= v22) {
          NSComparisonResult v5 = NSOrderedDescending;
        }
        else {
          NSComparisonResult v5 = NSOrderedAscending;
        }
        goto LABEL_58;
      }
    }
    float v25 = [(CSSearchableItem *)self attributeSet];
    char v26 = [v25 attributeDictionary];
    uint64_t v27 = [v26 objectForKeyedSubscript:@"kMDQueryResultScoreL1"];

    float v28 = [(CSSearchableItem *)v4 attributeSet];
    float v29 = [v28 attributeDictionary];
    long long v30 = [v29 objectForKeyedSubscript:@"kMDQueryResultScoreL1"];

    [v27 floatValue];
    float v32 = v31;
    [v30 floatValue];
    if (v32 == 0.0 || v33 == 0.0)
    {
      BOOL v40 = v33 == 0.0 || v32 != 0.0;
      if (v40) {
        NSComparisonResult v5 = NSOrderedAscending;
      }
      else {
        NSComparisonResult v5 = NSOrderedDescending;
      }
      if (v32 != 0.0 || !v40) {
        goto LABEL_38;
      }
    }
    else
    {
      [v27 floatValue];
      float v35 = v34;
      [v30 floatValue];
      if (v35 != v36)
      {
        [v27 floatValue];
        float v38 = v37;
        [v30 floatValue];
        if (v38 <= v39) {
          NSComparisonResult v5 = NSOrderedDescending;
        }
        else {
          NSComparisonResult v5 = NSOrderedAscending;
        }
LABEL_38:

LABEL_58:
        goto LABEL_59;
      }
    }
    __int16 v59 = v27;
    id v41 = [(CSSearchableItem *)self attributeSet];
    id v42 = [v41 attributeDictionary];
    id v43 = [v42 objectForKeyedSubscript:@"kMDQueryResultNewMatchedExtraQueriesField"];

    uint64_t v44 = [(CSSearchableItem *)v4 attributeSet];
    uint64_t v45 = [v44 attributeDictionary];
    id v46 = [v45 objectForKeyedSubscript:@"kMDQueryResultNewMatchedExtraQueriesField"];

    unint64_t v47 = (unint64_t)v43;
    if (v43)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && [v43 length] == 16)
      {
        uint64_t v48 = (void **)[v43 bytes];
        unint64_t v47 = (unint64_t)*v48;
        unint64_t v49 = (unint64_t)v48[1];
LABEL_41:
        if (v46 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v46 length] == 16)
        {
          uint64_t v50 = (void **)[v46 bytes];
          unint64_t v51 = (unint64_t)*v50;
          unint64_t v52 = (unint64_t)v50[1];
          unint64_t v53 = v47 | v49;
          if (v47 | v49 && v51 | v52)
          {
            BOOL v54 = v49 == v52 && v47 == v51;
            BOOL v55 = v59;
            if (!v54)
            {
              if (__PAIR128__(v52, v51) < __PAIR128__(v49, v47)) {
                NSComparisonResult v5 = NSOrderedAscending;
              }
              else {
                NSComparisonResult v5 = NSOrderedDescending;
              }
LABEL_56:

              if (v5 == NSOrderedSame)
              {
                uint64_t v56 = [(CSSearchableItem *)self uniqueIdentifier];
                __int16 v57 = [(CSSearchableItem *)v4 uniqueIdentifier];
                NSComparisonResult v5 = [v56 compare:v57];
              }
              goto LABEL_58;
            }
LABEL_55:
            NSComparisonResult v5 = NSOrderedSame;
            goto LABEL_56;
          }
          NSComparisonResult v5 = (unint64_t)((v51 | v52) != 0);
          BOOL v55 = v59;
          if (!v53) {
            goto LABEL_56;
          }
        }
        else
        {
          BOOL v55 = v59;
          if (!(v47 | v49)) {
            goto LABEL_55;
          }
        }
        NSComparisonResult v5 = NSOrderedAscending;
        goto LABEL_56;
      }
      unint64_t v47 = 0;
    }
    unint64_t v49 = 0;
    goto LABEL_41;
  }
  NSComparisonResult v5 = NSOrderedSame;
LABEL_59:

  return v5;
}

- (id)_propertiesDescription
{
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  id v4 = [NSString alloc];
  NSComparisonResult v5 = [(CSSearchableItem *)self uniqueIdentifier];
  int v6 = (void *)[v4 initWithFormat:@"uid=%@", v5];
  [v3 addObject:v6];

  objc_super v7 = [(CSSearchableItem *)self bundleID];
  if (v7)
  {
    uint64_t v8 = (void *)[[NSString alloc] initWithFormat:@"bundleID=%@", v7];
    [v3 addObject:v8];
  }
  unint64_t v9 = [(CSSearchableItem *)self attributeSet];
  objc_super v10 = [v9 contentType];

  if (v10)
  {
    uint64_t v11 = (void *)[[NSString alloc] initWithFormat:@"contentType=%@", v10];
    [v3 addObject:v11];
  }
  unint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3];
  if ([(CSSearchableItem *)self noIndex]) {
    [v12 addObject:@"should-not-be-indexed"];
  }
  if ([(CSSearchableItem *)self isUpdate]) {
    [v12 addObject:@"is-update"];
  }
  if ([v12 count])
  {
    id v13 = [NSString alloc];
    float v14 = [v12 componentsJoinedByString:@"|"];
    float v15 = (void *)[v13 initWithFormat:@"flags=%@", v14];
    [v3 addObject:v15];
  }
  float v16 = [v3 componentsJoinedByString:@", "];

  return v16;
}

- (id)description
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  NSComparisonResult v5 = [(CSSearchableItem *)self _propertiesDescription];
  int v6 = (void *)[v3 initWithFormat:@"<%@:%p; %@>", v4, self, v5];

  return v6;
}

- (id)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  NSComparisonResult v5 = [(CSSearchableItem *)self _propertiesDescription];
  int v6 = [(CSSearchableItem *)self attributeSet];
  objc_super v7 = (void *)[v3 initWithFormat:@"<%@:%p; %@, attributes=%@>", v4, self, v5, v6];

  return v7;
}

- (BOOL)_isFullyFormed
{
  id v3 = [(CSSearchableItem *)self uniqueIdentifier];
  if (v3)
  {
    uint64_t v4 = [(CSSearchableItem *)self attributeSet];
    NSComparisonResult v5 = [v4 contentType];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)_hasAttributesOfType:(id)a3
{
  uint64_t v4 = (__CFString *)a3;
  NSComparisonResult v5 = [(CSSearchableItem *)self attributeSet];
  BOOL v6 = [v5 contentType];
  int v7 = UTTypeConformsTo(v6, v4);

  return v7 != 0;
}

- (BOOL)noIndex
{
  v2 = [(CSSearchableItem *)self attributeSet];
  unint64_t v3 = ((unint64_t)[v2 searchableItemFlags] >> 1) & 1;

  return v3;
}

- (void)setNoIndex:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CSSearchableItem *)self attributeSet];
  unint64_t v4 = [v6 searchableItemFlags] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v5 = 2;
  if (!v3) {
    uint64_t v5 = 0;
  }
  [v6 setSearchableItemFlags:v4 | v5];
}

- (BOOL)allowTextStore
{
  v2 = [(CSSearchableItem *)self attributeSet];
  unint64_t v3 = ((unint64_t)[v2 searchableItemFlags] >> 4) & 1;

  return v3;
}

- (void)setAllowTextStore:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(CSSearchableItem *)self attributeSet];
  unint64_t v4 = [v6 searchableItemFlags] & 0xFFFFFFFFFFFFFFEFLL;
  uint64_t v5 = 16;
  if (!v3) {
    uint64_t v5 = 0;
  }
  [v6 setSearchableItemFlags:v4 | v5];
}

- (id)attributes
{
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 attributeDictionary];

  return v3;
}

- (void)setAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[CSSearchableItemAttributeSet alloc] initWithAttributes:v4];

  [(CSSearchableItem *)self setAttributeSet:v5];
}

- (id)copyReconstructedPrimaryRecipients
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 primaryRecipients];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)[v3 copy];
  }
  else
  {
    id v6 = [v2 attributeForKey:@"kMDItemPrimaryRecipientEmailAddresses"];
    char v26 = [v2 attributeForKey:@"kMDItemRecipientEmailAddresses"];
    float v24 = [v2 attributeForKey:@"kMDItemRecipients"];
    float v22 = v2;
    BOOL v23 = [v2 attributeForKey:@"kMDItemRecipientPhotosPersonIdentifiers"];
    uint64_t v5 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      objc_super v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          unint64_t v14 = [v26 indexOfObject:v13];

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v9 = 0;
          }
          else
          {
            if (v14 >= [v24 count])
            {
              unint64_t v9 = 0;
            }
            else
            {
              unint64_t v9 = [v24 objectAtIndex:v14];
            }
            if (v14 < [v23 count])
            {
              uint64_t v15 = [v23 objectAtIndex:v14];

              objc_super v10 = (void *)v15;
            }
          }
          float v16 = [CSPerson alloc];
          uint64_t v31 = v13;
          float v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
          float v18 = +[CSContactsWrapper sharedInstance];
          float v19 = [v18 CNContactEmailAddressesKeyString];
          float v20 = [(CSPerson *)v16 initWithDisplayName:v9 handles:v17 handleIdentifier:v19 photosPersonIdentifier:v10];

          [v5 addObject:v20];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
      objc_super v10 = 0;
    }

    id v4 = 0;
    v2 = v22;
  }

  return v5;
}

- (id)copyReconstructedAdditionalRecipients
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 additionalRecipients];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)[v3 copy];
  }
  else
  {
    id v6 = [v2 attributeForKey:@"kMDItemAdditionalRecipientEmailAddresses"];
    char v26 = [v2 attributeForKey:@"kMDItemRecipientEmailAddresses"];
    float v24 = [v2 attributeForKey:@"kMDItemRecipients"];
    float v22 = v2;
    BOOL v23 = [v2 attributeForKey:@"kMDItemRecipientPhotosPersonIdentifiers"];
    uint64_t v5 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      objc_super v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          unint64_t v14 = [v26 indexOfObject:v13];

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v9 = 0;
          }
          else
          {
            if (v14 >= [v24 count])
            {
              unint64_t v9 = 0;
            }
            else
            {
              unint64_t v9 = [v24 objectAtIndex:v14];
            }
            if (v14 < [v23 count])
            {
              uint64_t v15 = [v23 objectAtIndex:v14];

              objc_super v10 = (void *)v15;
            }
          }
          float v16 = [CSPerson alloc];
          uint64_t v31 = v13;
          float v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
          float v18 = +[CSContactsWrapper sharedInstance];
          float v19 = [v18 CNContactEmailAddressesKeyString];
          float v20 = [(CSPerson *)v16 initWithDisplayName:v9 handles:v17 handleIdentifier:v19 photosPersonIdentifier:v10];

          [v5 addObject:v20];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
      objc_super v10 = 0;
    }

    id v4 = 0;
    v2 = v22;
  }

  return v5;
}

- (id)copyReconstructedHiddenAdditionalRecipients
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 hiddenAdditionalRecipients];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = (void *)[v3 copy];
  }
  else
  {
    id v6 = [v2 attributeForKey:@"kMDItemHiddenAdditionalRecipientEmailAddresses"];
    char v26 = [v2 attributeForKey:@"kMDItemRecipientEmailAddresses"];
    float v24 = [v2 attributeForKey:@"kMDItemRecipients"];
    float v22 = v2;
    BOOL v23 = [v2 attributeForKey:@"kMDItemRecipientPhotosPersonIdentifiers"];
    uint64_t v5 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    obuint64_t j = v6;
    uint64_t v7 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = 0;
      objc_super v10 = 0;
      uint64_t v11 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          unint64_t v14 = [v26 indexOfObject:v13];

          if (v14 == 0x7FFFFFFFFFFFFFFFLL)
          {
            unint64_t v9 = 0;
          }
          else
          {
            if (v14 >= [v24 count])
            {
              unint64_t v9 = 0;
            }
            else
            {
              unint64_t v9 = [v24 objectAtIndex:v14];
            }
            if (v14 < [v23 count])
            {
              uint64_t v15 = [v23 objectAtIndex:v14];

              objc_super v10 = (void *)v15;
            }
          }
          float v16 = [CSPerson alloc];
          uint64_t v31 = v13;
          float v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
          float v18 = +[CSContactsWrapper sharedInstance];
          float v19 = [v18 CNContactEmailAddressesKeyString];
          float v20 = [(CSPerson *)v16 initWithDisplayName:v9 handles:v17 handleIdentifier:v19 photosPersonIdentifier:v10];

          [v5 addObject:v20];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v8);
    }
    else
    {
      unint64_t v9 = 0;
      objc_super v10 = 0;
    }

    id v4 = 0;
    v2 = v22;
  }

  return v5;
}

- (id)copyReconstructedRecipients
{
  v25[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 attributeForKey:@"kMDItemRecipientEmailAddresses"];
  id v4 = [v2 attributeForKey:@"kMDItemRecipients"];
  float v19 = v2;
  BOOL v23 = [v2 attributeForKey:@"kMDItemRecipientPhotosPersonIdentifiers"];
  float v24 = v3;
  uint64_t v5 = (char *)[v3 count];
  float v20 = v4;
  uint64_t v6 = [v4 count];
  if (v6) {
    BOOL v7 = v6 == (void)v5;
  }
  else {
    BOOL v7 = 0;
  }
  int v8 = v7;
  float v21 = v5;
  float v22 = objc_opt_new();
  if (v5)
  {
    unint64_t v9 = 0;
    do
    {
      objc_super v10 = [CSPerson alloc];
      if (v8)
      {
        uint64_t v5 = [v20 objectAtIndexedSubscript:v9];
        uint64_t v11 = v5;
      }
      else
      {
        uint64_t v11 = 0;
      }
      unint64_t v12 = [v24 objectAtIndexedSubscript:v9];
      v25[0] = v12;
      uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
      unint64_t v14 = +[CSContactsWrapper sharedInstance];
      uint64_t v15 = [v14 CNContactEmailAddressesKeyString];
      float v16 = [v23 objectAtIndexedSubscript:v9];
      float v17 = [(CSPerson *)v10 initWithDisplayName:v11 handles:v13 handleIdentifier:v15 photosPersonIdentifier:v16];

      if (v8) {
      [v22 addObject:v17];
      }

      ++v9;
    }
    while (v21 != v9);
  }

  return v22;
}

- (id)copyReconstructedAuthors
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CSSearchableItem *)self attributeSet];
  BOOL v3 = [v2 authors];
  if (v3)
  {
    id v4 = v3;
    id v5 = (id)[v3 copy];
  }
  else
  {
    uint64_t v6 = [v2 authorEmailAddresses];
    BOOL v7 = [v2 authorNames];
    int v8 = [v2 authorPhotosPersonIdentifiers];
    if (v6)
    {
      unint64_t v9 = [CSPerson alloc];
      float v18 = [v7 firstObject];
      float v19 = [v6 firstObject];
      float v20 = v19;
      objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
      uint64_t v11 = +[CSContactsWrapper sharedInstance];
      unint64_t v12 = [v11 CNContactEmailAddressesKeyString];
      [v8 firstObject];
      unint64_t v14 = v13 = v7;
      uint64_t v15 = [(CSPerson *)v9 initWithDisplayName:v18 handles:v10 handleIdentifier:v12 photosPersonIdentifier:v14];
      v21[0] = v15;
      float v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];

      BOOL v7 = v13;
    }
    else
    {
      float v16 = 0;
    }
    id v5 = v16;

    id v4 = v5;
  }

  return v5;
}

- (uint64_t)score
{
  objc_copyStruct(&v2, (const void *)(a1 + 16), 16, 1, 0);
  return v2;
}

- (void)setScore:(CSSearchableItem *)self
{
  uint64_t v4 = v2;
  uint64_t v5 = v3;
  objc_copyStruct(self->_score, &v4, 16, 1, 0);
}

uint64_t __70__CSSearchableItem_Internal___standardizeDocumentUnderstandingTopics___block_invoke()
{
  return 0;
}

uint64_t __74__CSSearchableItem_Internal___standardizeDocumentUnderstandingCategories___block_invoke()
{
  return 0;
}

BOOL __62__CSSearchableItem_Internal___standardizeSceneClassification___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  v41[4] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v6 = [v5 sceneIdentifier];
  [v5 sceneArea];
  float v8 = v7;
  [v5 boundingBox];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [v5 sceneType];
  uint64_t v18 = [v5 mediaType];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) |= v6 != 0;
  uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
  if (!*(unsigned char *)(v19 + 24))
  {
    BOOL v20 = v10 != 0.0;
    if (v12 != 0.0) {
      BOOL v20 = 1;
    }
    if (v14 != 0.0) {
      BOOL v20 = 1;
    }
    if (v16 != 0.0) {
      BOOL v20 = 1;
    }
    *(unsigned char *)(v19 + 24) = v20;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) |= v17 != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) |= v18 != 0;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= v8 != 0.0;
  if ((a3 & 1) != 0
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24))
  {
    float v21 = *(void **)(*(void *)(*(void *)(a1 + 80) + 8) + 40);
    uint64_t v40 = v18;
    float v22 = [NSNumber numberWithUnsignedLongLong:v6];
    [v21 addObject:v22];

    BOOL v23 = *(void **)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
    float v24 = [NSNumber numberWithDouble:v10];
    v41[0] = v24;
    float v25 = [NSNumber numberWithDouble:v12];
    v41[1] = v25;
    char v26 = [NSNumber numberWithDouble:v14];
    v41[2] = v26;
    long long v27 = [NSNumber numberWithDouble:v16];
    v41[3] = v27;
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:4];
    [v23 addObjectsFromArray:v28];

    long long v29 = *(void **)(*(void *)(*(void *)(a1 + 96) + 8) + 40);
    long long v30 = objc_msgSend(NSString, "stringWithFormat:", @"%d-%llu", v17, v6);
    [v29 addObject:v30];

    uint64_t v31 = *(void **)(*(void *)(*(void *)(a1 + 104) + 8) + 40);
    float v32 = [NSNumber numberWithUnsignedInt:v17];
    [v31 addObject:v32];

    uint64_t v33 = *(void **)(*(void *)(*(void *)(a1 + 112) + 8) + 40);
    float v34 = [NSNumber numberWithUnsignedInt:v40];
    [v33 addObject:v34];

    float v35 = *(void **)(*(void *)(*(void *)(a1 + 120) + 8) + 40);
    *(float *)&double v36 = v8;
    float v37 = [NSNumber numberWithFloat:v36];
    [v35 addObject:v37];

    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      goto LABEL_19;
    }
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)
    || *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
LABEL_19:
    BOOL v38 = 1;
  }
  else
  {
    BOOL v38 = *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0;
  }

  return v38;
}

uint64_t __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke()
{
  return 0;
}

uint64_t __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a2];
  uint64_t v4 = v3;
  uint64_t v5 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v6 = NSNumber;
  if (v3) {
    uint64_t v7 = [v3 countryCodeValue];
  }
  else {
    uint64_t v7 = -1;
  }
  float v8 = [v6 numberWithInteger:v7];
  [v5 addObject:v8];

  return 1;
}

uint64_t __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke_3()
{
  return 0;
}

uint64_t __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke_4()
{
  return 0;
}

uint64_t __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke_5()
{
  return 0;
}

uint64_t __60__CSSearchableItem_Internal___standardizeExtractedEntities___block_invoke_6()
{
  return 0;
}

uint64_t __67__CSSearchableItem_Internal___standardizeExtractedNumericEntities___block_invoke()
{
  return 0;
}

uint64_t __67__CSSearchableItem_Internal___standardizeExtractedNumericEntities___block_invoke_274()
{
  return 0;
}

uint64_t __67__CSSearchableItem_Internal___standardizeExtractedNumericEntities___block_invoke_286()
{
  return 0;
}

CSPerson *__335__CSSearchableItem_Internal___populateMissingPeopleWithNames_emailAddresses_allItemPersons_primaryItemPersons_additionalItemPersons_hiddenAdditionalItemPersons_personDictionary_contactProperties_nameKey_emailKey_contactIdentifierKey_personKey_photosPersonIdentifierKey_personTypeKey_nameAlternativesKey_faceAttributesKey_attributeSet___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
  {
    uint64_t v7 = +[CSContactsWrapper sharedInstance];
    uint64_t v8 = [v7 CNContactEmailAddressesKeyString];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    double v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  double v11 = [[CSPerson alloc] initWithDisplayName:v5 handles:v6 handleIdentifier:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  return v11;
}

- (id)filteredSpotlightAttributes
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (filteredSpotlightAttributes_once != -1) {
    dispatch_once(&filteredSpotlightAttributes_once, &__block_literal_global_300);
  }
  uint64_t v3 = [(CSSearchableItem *)self attributes];
  uint64_t v4 = [(CSSearchableItemAttributeSet *)self->_attributeSet attributeForKey:@"kMDItemTextContent"];
  uint64_t v5 = [(CSSearchableItemAttributeSet *)self->_attributeSet attributeForKey:@"kMDItemHTMLContent"];
  uint64_t v6 = [(CSSearchableItemAttributeSet *)self->_attributeSet attributeForKey:@"kMDItemHTMLContentData"];
  if (v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = (v5 | v6) == 0;
  }
  uint64_t v8 = &off_1E91AD000;
  if (v7)
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = (id)filteredSpotlightAttributes_coreSpotlightOnlyKeys;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          double v14 = -[CSSearchableItemAttributeSet attributeForKey:](self->_attributeSet, "attributeForKey:", *(void *)(*((void *)&v19 + 1) + 8 * i), (void)v19);

          if (v14)
          {

            id v15 = (id)[v3 mutableCopy];
            uint64_t v8 = &off_1E91AD000;
            goto LABEL_24;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    id v15 = v3;
  }
  else
  {
    id v15 = (id)[v3 mutableCopy];
    if (v6)
    {
      id v16 = (id)v6;
    }
    else
    {
      id v16 = [(id)v5 dataUsingEncoding:4];
    }
    uint64_t v17 = v16;
    uint64_t v4 = _MDPlainTextFromHTMLData(v16, 0x7FFFFFFFuLL, 0, 4);
    if (v4) {
      [v15 setObject:v4 forKey:@"kMDItemTextContent"];
    }

LABEL_24:
    [v15 removeObjectsForKeys:v8[190]];
  }

  return v15;
}

void __57__CSSearchableItem_Internal__filteredSpotlightAttributes__block_invoke()
{
  v2[19] = *MEMORY[0x1E4F143B8];
  v2[0] = @"kMDItemAuthorsDictionary";
  v2[1] = @"kMDItemPrimaryRecipientsDictionary";
  v2[2] = @"kMDItemAdditionalRecipientsDictionary";
  v2[3] = @"kMDItemHiddenAdditionalRecipientsDictionary";
  v2[4] = @"kMDItemAuthorContactProperties";
  v2[5] = @"kMDItemPrimaryRecipientContactProperties";
  v2[6] = @"kMDItemAdditionalRecipientContactProperties";
  v2[7] = @"kMDItemHiddenAdditionalRecipientContactProperties";
  v2[8] = @"kMDItemHTMLContent";
  v2[9] = @"kMDItemAuthorPersons";
  v2[10] = @"kMDItemPrimaryRecipientPersons";
  v2[11] = @"kMDItemAdditionalRecipientPersons";
  v2[12] = @"kMDItemHiddenAdditionalRecipientPersons";
  v2[13] = @"kMDItemEmailHeadersDictionary";
  v2[14] = @"kMDItemRelatedUniqueIdentifier";
  v2[15] = @"kMDItemWeakRelatedUniqueIdentifier";
  v2[16] = @"kMDItemHTMLContentData";
  v2[17] = @"kMDItemAlternateNames";
  v2[18] = @"kMDItemContentURL";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:19];
  v1 = (void *)filteredSpotlightAttributes_coreSpotlightOnlyKeys;
  filteredSpotlightAttributes_coreSpotlightOnlyKeys = v0;
}

- (void)_updateWithSearchableItem:(id)a3
{
  id v8 = a3;
  if ([v8 isUpdate])
  {
    uint64_t v4 = [v8 expirationDate];

    if (v4)
    {
      uint64_t v5 = [v8 expirationDate];
      [(CSSearchableItem *)self setExpirationDate:v5];
    }
    uint64_t v6 = [(CSSearchableItem *)self attributeSet];
    BOOL v7 = [v8 attributeSet];
    [v6 addAttributesFromAttributeSet:v7];
  }
}

@end