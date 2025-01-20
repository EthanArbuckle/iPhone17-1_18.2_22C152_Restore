@interface GDGraphPerson
- (GDGraphPerson)initWithEntityIdentifierField:(id)a3 fullNamesField:(id)a4 prefixesField:(id)a5 givenNamesField:(id)a6 phoneticGivenNamesField:(id)a7 middleNamesField:(id)a8 phoneticMiddleNamesField:(id)a9 familyNamesField:(id)a10 phoneticFamilyNamesField:(id)a11 previousFamilyNamesField:(id)a12 suffixesField:(id)a13 nicknamesField:(id)a14 birthNamesField:(id)a15 birthdayField:(id)a16 occupationField:(id)a17 isFavoriteField:(id)a18 isCurrentUserField:(id)a19 isInferredDeviceUserField:(id)a20 associatedPeopleField:(id)a21 locationsField:(id)a22 employersField:(id)a23 topicsField:(id)a24 handlesField:(id)a25 identifiersField:(id)a26 contactIdentifierField:(id)a27 visualIdentifiersField:(id)a28 allBirthdayField:(id)a29 allOccupationField:(id)a30 allIsFavoriteField:(id)a31 allIsCurrentUserField:(id)a32 allIsInferredDeviceUserField:(id)a33 allContactIdentifierField:(id)a34;
- (GDGraphPersonEntityIdentifier)entityIdentifier;
- (NSArray)allBirthday;
- (NSArray)allContactIdentifier;
- (NSArray)allIsCurrentUser;
- (NSArray)allIsFavorite;
- (NSArray)allIsInferredDeviceUser;
- (NSArray)allOccupation;
- (NSArray)associatedPeople;
- (NSArray)birthNames;
- (NSArray)employers;
- (NSArray)familyNames;
- (NSArray)fullNames;
- (NSArray)givenNames;
- (NSArray)handles;
- (NSArray)identifiers;
- (NSArray)locations;
- (NSArray)middleNames;
- (NSArray)nicknames;
- (NSArray)phoneticFamilyNames;
- (NSArray)phoneticGivenNames;
- (NSArray)phoneticMiddleNames;
- (NSArray)prefixes;
- (NSArray)previousFamilyNames;
- (NSArray)suffixes;
- (NSArray)topics;
- (NSArray)visualIdentifiers;
- (NSDate)birthday;
- (NSNumber)isCurrentUser;
- (NSNumber)isFavorite;
- (NSNumber)isInferredDeviceUser;
- (NSPersonNameComponents)suggestedNameComponentsInner;
- (NSString)contactIdentifier;
- (NSString)occupation;
- (NSString)suggestedContactIdentifierInner;
- (NSString)suggestedNameStringInner;
- (id)suggestedContactIdentifier;
- (id)suggestedNameComponents;
- (id)suggestedNameString;
- (int64_t)autonamingSuggestionReason;
- (int64_t)autonamingSuggestionReasonInner;
@end

@implementation GDGraphPerson

- (NSPersonNameComponents)suggestedNameComponentsInner
{
  uint64_t v3 = sub_1B29A3EB4(&qword_1E9C3B238);
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  GDGraphPerson.suggestedNameComponentsInner.getter((uint64_t)v5);

  uint64_t v7 = sub_1B2E80368();
  v8 = 0;
  if (_s20IntelligencePlatform17UnstructuredImageV5AssetOwet_0((uint64_t)v5, 1, v7) != 1)
  {
    v8 = (void *)sub_1B2E80338();
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }

  return (NSPersonNameComponents *)v8;
}

- (NSString)suggestedNameStringInner
{
  return (NSString *)sub_1B2C39CAC(self, (uint64_t)a2, GDGraphPerson.suggestedNameStringInner.getter);
}

- (NSString)suggestedContactIdentifierInner
{
  return (NSString *)sub_1B2C39CAC(self, (uint64_t)a2, (uint64_t (*)(void))GDGraphPerson.suggestedContactIdentifierInner.getter);
}

- (int64_t)autonamingSuggestionReasonInner
{
  v2 = self;
  int64_t v3 = GDGraphPerson.autonamingSuggestionReasonInner.getter();

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allContactIdentifier, 0);
  objc_storeStrong((id *)&self->_allIsInferredDeviceUser, 0);
  objc_storeStrong((id *)&self->_allIsCurrentUser, 0);
  objc_storeStrong((id *)&self->_allIsFavorite, 0);
  objc_storeStrong((id *)&self->_allOccupation, 0);
  objc_storeStrong((id *)&self->_allBirthday, 0);
  objc_storeStrong((id *)&self->_visualIdentifiers, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_handles, 0);
  objc_storeStrong((id *)&self->_topics, 0);
  objc_storeStrong((id *)&self->_employers, 0);
  objc_storeStrong((id *)&self->_locations, 0);
  objc_storeStrong((id *)&self->_associatedPeople, 0);
  objc_storeStrong((id *)&self->_isInferredDeviceUser, 0);
  objc_storeStrong((id *)&self->_isCurrentUser, 0);
  objc_storeStrong((id *)&self->_isFavorite, 0);
  objc_storeStrong((id *)&self->_occupation, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_birthNames, 0);
  objc_storeStrong((id *)&self->_nicknames, 0);
  objc_storeStrong((id *)&self->_suffixes, 0);
  objc_storeStrong((id *)&self->_previousFamilyNames, 0);
  objc_storeStrong((id *)&self->_phoneticFamilyNames, 0);
  objc_storeStrong((id *)&self->_familyNames, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleNames, 0);
  objc_storeStrong((id *)&self->_middleNames, 0);
  objc_storeStrong((id *)&self->_phoneticGivenNames, 0);
  objc_storeStrong((id *)&self->_givenNames, 0);
  objc_storeStrong((id *)&self->_prefixes, 0);
  objc_storeStrong((id *)&self->_fullNames, 0);

  objc_storeStrong((id *)&self->_entityIdentifier, 0);
}

- (NSArray)allContactIdentifier
{
  return self->_allContactIdentifier;
}

- (NSArray)allIsInferredDeviceUser
{
  return self->_allIsInferredDeviceUser;
}

- (NSArray)allIsCurrentUser
{
  return self->_allIsCurrentUser;
}

- (NSArray)allIsFavorite
{
  return self->_allIsFavorite;
}

- (NSArray)allOccupation
{
  return self->_allOccupation;
}

- (NSArray)allBirthday
{
  return self->_allBirthday;
}

- (NSArray)visualIdentifiers
{
  return self->_visualIdentifiers;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)handles
{
  return self->_handles;
}

- (NSArray)topics
{
  return self->_topics;
}

- (NSArray)employers
{
  return self->_employers;
}

- (NSArray)locations
{
  return self->_locations;
}

- (NSArray)associatedPeople
{
  return self->_associatedPeople;
}

- (NSNumber)isInferredDeviceUser
{
  return self->_isInferredDeviceUser;
}

- (NSNumber)isCurrentUser
{
  return self->_isCurrentUser;
}

- (NSNumber)isFavorite
{
  return self->_isFavorite;
}

- (NSString)occupation
{
  return self->_occupation;
}

- (NSDate)birthday
{
  return self->_birthday;
}

- (NSArray)birthNames
{
  return self->_birthNames;
}

- (NSArray)nicknames
{
  return self->_nicknames;
}

- (NSArray)suffixes
{
  return self->_suffixes;
}

- (NSArray)previousFamilyNames
{
  return self->_previousFamilyNames;
}

- (NSArray)phoneticFamilyNames
{
  return self->_phoneticFamilyNames;
}

- (NSArray)familyNames
{
  return self->_familyNames;
}

- (NSArray)phoneticMiddleNames
{
  return self->_phoneticMiddleNames;
}

- (NSArray)middleNames
{
  return self->_middleNames;
}

- (NSArray)phoneticGivenNames
{
  return self->_phoneticGivenNames;
}

- (NSArray)givenNames
{
  return self->_givenNames;
}

- (NSArray)prefixes
{
  return self->_prefixes;
}

- (NSArray)fullNames
{
  return self->_fullNames;
}

- (GDGraphPersonEntityIdentifier)entityIdentifier
{
  return self->_entityIdentifier;
}

- (GDGraphPerson)initWithEntityIdentifierField:(id)a3 fullNamesField:(id)a4 prefixesField:(id)a5 givenNamesField:(id)a6 phoneticGivenNamesField:(id)a7 middleNamesField:(id)a8 phoneticMiddleNamesField:(id)a9 familyNamesField:(id)a10 phoneticFamilyNamesField:(id)a11 previousFamilyNamesField:(id)a12 suffixesField:(id)a13 nicknamesField:(id)a14 birthNamesField:(id)a15 birthdayField:(id)a16 occupationField:(id)a17 isFavoriteField:(id)a18 isCurrentUserField:(id)a19 isInferredDeviceUserField:(id)a20 associatedPeopleField:(id)a21 locationsField:(id)a22 employersField:(id)a23 topicsField:(id)a24 handlesField:(id)a25 identifiersField:(id)a26 contactIdentifierField:(id)a27 visualIdentifiersField:(id)a28 allBirthdayField:(id)a29 allOccupationField:(id)a30 allIsFavoriteField:(id)a31 allIsCurrentUserField:(id)a32 allIsInferredDeviceUserField:(id)a33 allContactIdentifierField:(id)a34
{
  id v77 = a3;
  id v49 = a4;
  id v76 = a4;
  id v75 = a5;
  id v50 = a6;
  id v74 = a6;
  id v73 = a7;
  id v72 = a8;
  id v71 = a9;
  id v70 = a10;
  id v69 = a11;
  id v68 = a12;
  id v67 = a13;
  id v66 = a14;
  id v65 = a15;
  id v64 = a16;
  id v63 = a17;
  id v62 = a18;
  id v61 = a19;
  id v60 = a20;
  id v59 = a21;
  id v39 = a22;
  id v40 = a23;
  id v41 = a24;
  id v42 = a25;
  id v43 = a26;
  id v56 = a27;
  id v44 = a28;
  id v58 = a29;
  id v57 = a30;
  id v55 = a31;
  id v54 = a32;
  id v53 = a33;
  id v52 = a34;
  v78.receiver = self;
  v78.super_class = (Class)GDGraphPerson;
  v45 = [(GDGraphPerson *)&v78 init];
  v46 = v45;
  if (v45)
  {
    objc_storeStrong((id *)&v45->_entityIdentifier, a3);
    objc_storeStrong((id *)&v46->_fullNames, v49);
    objc_storeStrong((id *)&v46->_prefixes, a5);
    objc_storeStrong((id *)&v46->_givenNames, v50);
    objc_storeStrong((id *)&v46->_phoneticGivenNames, a7);
    objc_storeStrong((id *)&v46->_middleNames, a8);
    objc_storeStrong((id *)&v46->_phoneticMiddleNames, a9);
    objc_storeStrong((id *)&v46->_familyNames, a10);
    objc_storeStrong((id *)&v46->_phoneticFamilyNames, a11);
    objc_storeStrong((id *)&v46->_previousFamilyNames, a12);
    objc_storeStrong((id *)&v46->_suffixes, a13);
    objc_storeStrong((id *)&v46->_nicknames, a14);
    objc_storeStrong((id *)&v46->_birthNames, a15);
    objc_storeStrong((id *)&v46->_birthday, a16);
    objc_storeStrong((id *)&v46->_occupation, a17);
    objc_storeStrong((id *)&v46->_isFavorite, a18);
    objc_storeStrong((id *)&v46->_isCurrentUser, a19);
    objc_storeStrong((id *)&v46->_isInferredDeviceUser, a20);
    objc_storeStrong((id *)&v46->_associatedPeople, a21);
    objc_storeStrong((id *)&v46->_locations, a22);
    objc_storeStrong((id *)&v46->_employers, a23);
    objc_storeStrong((id *)&v46->_topics, a24);
    objc_storeStrong((id *)&v46->_handles, a25);
    objc_storeStrong((id *)&v46->_identifiers, a26);
    objc_storeStrong((id *)&v46->_contactIdentifier, a27);
    objc_storeStrong((id *)&v46->_visualIdentifiers, a28);
    objc_storeStrong((id *)&v46->_allBirthday, a29);
    objc_storeStrong((id *)&v46->_allOccupation, a30);
    objc_storeStrong((id *)&v46->_allIsFavorite, a31);
    objc_storeStrong((id *)&v46->_allIsCurrentUser, a32);
    objc_storeStrong((id *)&v46->_allIsInferredDeviceUser, a33);
    objc_storeStrong((id *)&v46->_allContactIdentifier, a34);
  }

  return v46;
}

- (int64_t)autonamingSuggestionReason
{
  return ((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1F4181798])(self, sel_autonamingSuggestionReasonInner);
}

- (id)suggestedContactIdentifier
{
  return (id)((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1F4181798])(self, sel_suggestedContactIdentifierInner);
}

- (id)suggestedNameString
{
  return (id)((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1F4181798])(self, sel_suggestedNameStringInner);
}

- (id)suggestedNameComponents
{
  return (id)((uint64_t (*)(GDGraphPerson *, char *))MEMORY[0x1F4181798])(self, sel_suggestedNameComponentsInner);
}

@end