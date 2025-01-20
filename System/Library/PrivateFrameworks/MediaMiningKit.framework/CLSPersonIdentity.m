@interface CLSPersonIdentity
+ (BOOL)isChildRelationship:(unint64_t)a3;
+ (BOOL)isFamilyRelationship:(unint64_t)a3;
+ (BOOL)isParentRelationship:(unint64_t)a3;
+ (BOOL)isSiblingRelationship:(unint64_t)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_personRelationshipVocabularyByLocaleDictionary;
+ (id)descriptionForPersonRelationship:(unint64_t)a3;
+ (id)mePerson;
+ (id)person;
+ (id)personWithCNIdentifier:(id)a3;
+ (id)personWithGDIdentifier:(id)a3;
+ (id)personWithLocalIdentifier:(id)a3;
+ (id)personWithPHPerson:(id)a3;
+ (id)presentationStringForPeople:(id)a3;
+ (id)presentationStringForPeople:(id)a3 withScores:(id)a4;
+ (id)relationshipRegularExpressionForRelationship:(unint64_t)a3 locale:(id)a4;
- (BOOL)hasAddresses;
- (BOOL)hasContactProfilePicture;
- (BOOL)hasPhoneNumber;
- (BOOL)hasSameFamilyNameAsPerson:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPerson:(id)a3;
- (BOOL)isFavorite;
- (BOOL)isHidden;
- (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)a3 closeToAddressesOfType:(unint64_t)a4;
- (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)a3 farAwayFromAddressesOfType:(unint64_t)a4;
- (BOOL)isMe;
- (BOOL)isOrganization;
- (BOOL)isSamePersonAs:(id)a3;
- (BOOL)isUserCreated;
- (CLSPersonIdentity)init;
- (CLSPersonIdentity)initWithCoder:(id)a3;
- (NSArray)sourceURLs;
- (NSDate)anniversaryDate;
- (NSDate)birthdayDate;
- (NSDate)potentialBirthdayDate;
- (NSMutableDictionary)socialProfiles;
- (NSSet)emailAddresses;
- (NSSet)phoneNumbers;
- (NSString)CNIdentifier;
- (NSString)GDIdentifier;
- (NSString)companyName;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)inferredLastName;
- (NSString)lastName;
- (NSString)localIdentifier;
- (NSString)localizedShortName;
- (NSString)middleName;
- (NSString)nickname;
- (NSString)shareParticipantLocalIdentifier;
- (id)_addressArrayFromAddressType:(unint64_t)a3;
- (id)_motherAndFatherRelationships;
- (id)_relationshipAsString;
- (id)description;
- (id)pluralPresentationString;
- (id)presentationString;
- (id)sourceService;
- (unint64_t)ageCategory;
- (unint64_t)countOfAddressesOfType:(unint64_t)a3;
- (unint64_t)relationship;
- (unint64_t)relationshipHintFromNameUsingLocales:(id)a3;
- (unint64_t)sex;
- (void)_enumerateAddresses:(id)a3 as:(id)a4 withBlock:(id)a5;
- (void)addAddresses:(id)a3 ofType:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateAddressesOfType:(unint64_t)a3 asCLLocationsWithBlock:(id)a4;
- (void)enumerateAddressesOfType:(unint64_t)a3 asPlacemarkWithBlock:(id)a4;
- (void)mergeWithPerson:(id)a3;
- (void)prefetchPersonAddressesIfNeededWithLocationCache:(id)a3;
- (void)setAgeCategory:(unint64_t)a3;
- (void)setAnniversaryDate:(id)a3;
- (void)setBirthdayDate:(id)a3;
- (void)setCNIdentifier:(id)a3;
- (void)setCompanyName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setGDIdentifier:(id)a3;
- (void)setHasContactProfilePicture:(BOOL)a3;
- (void)setHasPhoneNumber:(BOOL)a3;
- (void)setInferredLastName:(id)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsHidden:(BOOL)a3;
- (void)setIsUserCreated:(BOOL)a3;
- (void)setLastName:(id)a3;
- (void)setLocalIdentifier:(id)a3;
- (void)setLocalizedShortName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNickname:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPotentialBirthdayDate:(id)a3;
- (void)setRelationship:(unint64_t)a3;
- (void)setSex:(unint64_t)a3;
- (void)setShareParticipantLocalIdentifier:(id)a3;
- (void)setSocialProfiles:(id)a3;
- (void)setSourceService:(id)a3 andID:(id)a4;
@end

@implementation CLSPersonIdentity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shareParticipantLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_localizedShortName, 0);
  objc_storeStrong((id *)&self->_inferredLastName, 0);
  objc_storeStrong((id *)&self->_sourceURLs, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_companyName, 0);
  objc_storeStrong((id *)&self->_anniversaryDate, 0);
  objc_storeStrong((id *)&self->_potentialBirthdayDate, 0);
  objc_storeStrong((id *)&self->_birthdayDate, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_GDIdentifier, 0);
  objc_storeStrong((id *)&self->_CNIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_sourceService, 0);
  objc_storeStrong((id *)&self->_workAddresses, 0);
  objc_storeStrong((id *)&self->_homeAddresses, 0);
}

- (void)setShareParticipantLocalIdentifier:(id)a3
{
}

- (NSString)shareParticipantLocalIdentifier
{
  return self->_shareParticipantLocalIdentifier;
}

- (NSString)localizedShortName
{
  return self->_localizedShortName;
}

- (void)setInferredLastName:(id)a3
{
}

- (NSArray)sourceURLs
{
  return self->_sourceURLs;
}

- (void)setRelationship:(unint64_t)a3
{
  self->_relationship = a3;
}

- (unint64_t)relationship
{
  return self->_relationship;
}

- (void)setPhoneNumbers:(id)a3
{
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (void)setEmailAddresses:(id)a3
{
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (void)setSocialProfiles:(id)a3
{
}

- (NSMutableDictionary)socialProfiles
{
  return self->_socialProfiles;
}

- (NSString)companyName
{
  return self->_companyName;
}

- (void)setHasPhoneNumber:(BOOL)a3
{
  self->_hasPhoneNumber = a3;
}

- (BOOL)hasPhoneNumber
{
  return self->_hasPhoneNumber;
}

- (void)setHasContactProfilePicture:(BOOL)a3
{
  self->_hasContactProfilePicture = a3;
}

- (BOOL)hasContactProfilePicture
{
  return self->_hasContactProfilePicture;
}

- (void)setIsUserCreated:(BOOL)a3
{
  self->_isUserCreated = a3;
}

- (BOOL)isUserCreated
{
  return self->_isUserCreated;
}

- (void)setIsHidden:(BOOL)a3
{
  self->_isHidden = a3;
}

- (BOOL)isHidden
{
  return self->_isHidden;
}

- (void)setIsFavorite:(BOOL)a3
{
  self->_isFavorite = a3;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (void)setAnniversaryDate:(id)a3
{
}

- (NSDate)anniversaryDate
{
  return self->_anniversaryDate;
}

- (void)setPotentialBirthdayDate:(id)a3
{
}

- (NSDate)potentialBirthdayDate
{
  return self->_potentialBirthdayDate;
}

- (void)setBirthdayDate:(id)a3
{
}

- (NSDate)birthdayDate
{
  return self->_birthdayDate;
}

- (void)setAgeCategory:(unint64_t)a3
{
  self->_ageCategory = a3;
}

- (unint64_t)ageCategory
{
  return self->_ageCategory;
}

- (void)setSex:(unint64_t)a3
{
  self->_sex = a3;
}

- (unint64_t)sex
{
  return self->_sex;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (void)setGDIdentifier:(id)a3
{
}

- (NSString)GDIdentifier
{
  return self->_GDIdentifier;
}

- (void)setCNIdentifier:(id)a3
{
}

- (NSString)CNIdentifier
{
  return self->_CNIdentifier;
}

- (void)setLocalIdentifier:(id)a3
{
}

- (NSString)localIdentifier
{
  return self->_localIdentifier;
}

- (BOOL)isOrganization
{
  return [(NSString *)self->_companyName length]
      && ![(NSString *)self->_firstName length]
      && ![(NSString *)self->_lastName length]
      && ![(NSString *)self->_nickname length];
}

- (id)_motherAndFatherRelationships
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F28F2CD8];
}

- (unint64_t)relationshipHintFromNameUsingLocales:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [MEMORY[0x1E4F1CA80] set];
  v6 = [(CLSPersonIdentity *)self _motherAndFatherRelationships];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    v29 = v6;
    v30 = v5;
    id v28 = v7;
    uint64_t v25 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      uint64_t v26 = v9;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "languageCode", v25);
        if (v13 && ([v5 containsObject:v13] & 1) == 0)
        {
          uint64_t v27 = v11;
          v31 = v13;
          [v5 addObject:v13];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          id obj = v6;
          uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v34;
            while (2)
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v34 != v16) {
                  objc_enumerationMutation(obj);
                }
                unint64_t v18 = [*(id *)(*((void *)&v33 + 1) + 8 * i) unsignedIntegerValue];
                v19 = [(id)objc_opt_class() relationshipRegularExpressionForRelationship:v18 locale:v12];
                if (v19)
                {
                  v20 = [(CLSPersonIdentity *)self fullName];
                  v21 = [(CLSPersonIdentity *)self fullName];
                  v22 = objc_msgSend(v19, "matchesInString:options:range:", v20, 0, 0, objc_msgSend(v21, "length"));

                  uint64_t v23 = [v22 count];
                  if (v23)
                  {

                    v6 = v29;
                    v5 = v30;
                    id v7 = v28;
                    goto LABEL_23;
                  }
                }
              }
              uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }

          v6 = v29;
          v5 = v30;
          uint64_t v11 = v27;
          id v7 = v28;
          uint64_t v10 = v25;
          uint64_t v9 = v26;
          v13 = v31;
        }

        ++v11;
      }
      while (v11 != v9);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v42 count:16];
      unint64_t v18 = 0;
    }
    while (v9);
  }
  else
  {
    unint64_t v18 = 0;
  }
LABEL_23:

  return v18;
}

- (NSString)inferredLastName
{
  inferredLastName = self->_inferredLastName;
  if (!inferredLastName)
  {
    id v4 = [(CLSPersonIdentity *)self lastName];
    v5 = [(CLSPersonIdentity *)self fullName];
    if ([v4 length])
    {
      v6 = v4;
      id v7 = self->_inferredLastName;
      self->_inferredLastName = v6;
    }
    else
    {
      if (![v5 length])
      {
LABEL_7:

        inferredLastName = self->_inferredLastName;
        goto LABEL_8;
      }
      id v7 = (NSString *)objc_alloc_init(MEMORY[0x1E4F28F38]);
      uint64_t v8 = [(NSString *)v7 personNameComponentsFromString:v5];
      uint64_t v9 = [v8 familyName];
      uint64_t v10 = self->_inferredLastName;
      self->_inferredLastName = v9;
    }
    goto LABEL_7;
  }
LABEL_8:
  return inferredLastName;
}

- (BOOL)hasSameFamilyNameAsPerson:(id)a3
{
  id v4 = a3;
  v5 = [(CLSPersonIdentity *)self inferredLastName];
  v6 = [v4 inferredLastName];

  if ([v5 length])
  {
    id v7 = [v5 lowercaseString];
    uint64_t v8 = [v6 lowercaseString];
    char v9 = [v7 isEqualToString:v8];
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)a3 farAwayFromAddressesOfType:(unint64_t)a4
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__CLSPersonIdentity_isLocationCoordinate_farAwayFromAddressesOfType___block_invoke;
  v6[3] = &unk_1E690ECE0;
  CLLocationCoordinate2D v7 = a3;
  v6[4] = &v8;
  [(CLSPersonIdentity *)self enumerateAddressesOfType:a4 asCLLocationsWithBlock:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

BOOL __69__CLSPersonIdentity_isLocationCoordinate_farAwayFromAddressesOfType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 coordinate];
  BOOL result = +[CLSNewLocationInformant location:isFarFromLocation:](CLSNewLocationInformant, "location:isFarFromLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48), v5, v6);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isLocationCoordinate:(CLLocationCoordinate2D)a3 closeToAddressesOfType:(unint64_t)a4
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__CLSPersonIdentity_isLocationCoordinate_closeToAddressesOfType___block_invoke;
  v6[3] = &unk_1E690ECE0;
  CLLocationCoordinate2D v7 = a3;
  v6[4] = &v8;
  [(CLSPersonIdentity *)self enumerateAddressesOfType:a4 asCLLocationsWithBlock:v6];
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

BOOL __65__CLSPersonIdentity_isLocationCoordinate_closeToAddressesOfType___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  [a2 coordinate];
  BOOL result = +[CLSNewLocationInformant location:isCloseToLocation:](CLSNewLocationInformant, "location:isCloseToLocation:", *(double *)(a1 + 40), *(double *)(a1 + 48), v5, v6);
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

- (BOOL)isEqualToPerson:(id)a3
{
  id v6 = a3;
  fullName = self->_fullName;
  uint64_t v8 = [v6 fullName];
  if (fullName != v8)
  {
    char v9 = self->_fullName;
    v3 = [v6 fullName];
    if (![(NSString *)v9 isEqualToString:v3])
    {
      BOOL v10 = 0;
LABEL_73:

      goto LABEL_74;
    }
  }
  firstName = self->_firstName;
  v12 = [v6 firstName];
  if (firstName == v12
    || (v13 = self->_firstName,
        [v6 firstName],
        char v4 = objc_claimAutoreleasedReturnValue(),
        [(NSString *)v13 isEqualToString:v4]))
  {
    lastName = self->_lastName;
    uint64_t v15 = [v6 lastName];
    v88 = lastName;
    if (lastName != v15)
    {
      uint64_t v16 = self->_lastName;
      uint64_t v17 = [v6 lastName];
      unint64_t v18 = v16;
      v19 = (void *)v17;
      if (![(NSString *)v18 isEqualToString:v17])
      {
        BOOL v10 = 0;
LABEL_69:

LABEL_70:
        if (firstName == v12) {
          goto LABEL_72;
        }
        goto LABEL_71;
      }
      v84 = v19;
    }
    middleName = self->_middleName;
    v89 = [v6 middleName];
    v85 = middleName;
    v86 = firstName;
    v87 = v4;
    if (middleName != v89)
    {
      v21 = self->_middleName;
      v83 = [v6 middleName];
      if (!-[NSString isEqualToString:](v21, "isEqualToString:"))
      {
        BOOL v10 = 0;
        firstName = v86;
LABEL_67:

LABEL_68:
        v19 = v84;
        if (v88 == v15) {
          goto LABEL_70;
        }
        goto LABEL_69;
      }
    }
    nickname = self->_nickname;
    uint64_t v23 = [v6 nickname];
    v82 = nickname;
    if (nickname != v23)
    {
      v24 = self->_nickname;
      v80 = [v6 nickname];
      if (!-[NSString isEqualToString:](v24, "isEqualToString:"))
      {
        BOOL v10 = 0;
        uint64_t v25 = middleName;
LABEL_65:

LABEL_66:
        BOOL v46 = v25 == v89;
        firstName = v86;
        char v4 = v87;
        if (v46) {
          goto LABEL_68;
        }
        goto LABEL_67;
      }
    }
    birthdayDate = self->_birthdayDate;
    uint64_t v81 = [v6 birthdayDate];
    if (birthdayDate != (NSDate *)v81)
    {
      uint64_t v27 = self->_birthdayDate;
      v77 = [v6 birthdayDate];
      if (!-[NSDate isEqualToDate:](v27, "isEqualToDate:"))
      {
        BOOL v10 = 0;
        uint64_t v25 = v85;
        id v28 = (void *)v81;
LABEL_63:

LABEL_64:
        if (v82 == v23) {
          goto LABEL_66;
        }
        goto LABEL_65;
      }
    }
    potentialBirthdayDate = self->_potentialBirthdayDate;
    uint64_t v78 = [v6 potentialBirthdayDate];
    v79 = birthdayDate;
    v76 = potentialBirthdayDate;
    if (potentialBirthdayDate != (NSDate *)v78)
    {
      v30 = self->_potentialBirthdayDate;
      v73 = [v6 potentialBirthdayDate];
      if (!-[NSDate isEqualToDate:](v30, "isEqualToDate:"))
      {
        BOOL v10 = 0;
        uint64_t v25 = v85;
        v31 = (NSDate *)v78;
LABEL_61:

LABEL_62:
        id v28 = (void *)v81;
        if (v79 == (NSDate *)v81) {
          goto LABEL_64;
        }
        goto LABEL_63;
      }
    }
    anniversaryDate = self->_anniversaryDate;
    uint64_t v74 = [v6 anniversaryDate];
    v75 = v23;
    v72 = anniversaryDate;
    if (anniversaryDate != (NSDate *)v74)
    {
      long long v33 = self->_anniversaryDate;
      v70 = [v6 anniversaryDate];
      if (!-[NSDate isEqualToDate:](v33, "isEqualToDate:"))
      {
        BOOL v10 = 0;
        uint64_t v25 = v85;
        v31 = (NSDate *)v78;
        long long v34 = (void *)v74;
LABEL_59:

LABEL_60:
        uint64_t v23 = v75;
        if (v76 == v31) {
          goto LABEL_62;
        }
        goto LABEL_61;
      }
    }
    companyName = self->_companyName;
    uint64_t v71 = [v6 companyName];
    v69 = companyName;
    if (companyName != (NSString *)v71)
    {
      long long v36 = self->_companyName;
      v67 = [v6 companyName];
      if (!-[NSString isEqualToString:](v36, "isEqualToString:"))
      {
        BOOL v10 = 0;
        uint64_t v25 = v85;
        v31 = (NSDate *)v78;
        long long v37 = (NSString *)v71;
LABEL_57:

LABEL_58:
        long long v34 = (void *)v74;
        if (v72 == (NSDate *)v74) {
          goto LABEL_60;
        }
        goto LABEL_59;
      }
    }
    socialProfiles = self->_socialProfiles;
    [v6 socialProfiles];
    uint64_t v68 = v66 = socialProfiles;
    if (socialProfiles != (NSMutableDictionary *)v68)
    {
      long long v39 = self->_socialProfiles;
      v64 = [v6 socialProfiles];
      if (!-[NSMutableDictionary isEqualToDictionary:](v39, "isEqualToDictionary:"))
      {
        BOOL v10 = 0;
        v31 = (NSDate *)v78;
        long long v37 = (NSString *)v71;
        long long v40 = (void *)v68;
LABEL_55:

LABEL_56:
        uint64_t v25 = v85;
        if (v69 == v37) {
          goto LABEL_58;
        }
        goto LABEL_57;
      }
    }
    emailAddresses = self->_emailAddresses;
    uint64_t v65 = [v6 emailAddresses];
    v63 = emailAddresses;
    if (emailAddresses != (NSSet *)v65)
    {
      v42 = self->_emailAddresses;
      v62 = [v6 emailAddresses];
      if (!-[NSSet isEqualToSet:](v42, "isEqualToSet:"))
      {
        BOOL v10 = 0;
        uint64_t v43 = (void *)v65;
LABEL_53:

LABEL_54:
        long long v40 = (void *)v68;
        v31 = (NSDate *)v78;
        long long v37 = (NSString *)v71;
        if (v66 == (NSMutableDictionary *)v68) {
          goto LABEL_56;
        }
        goto LABEL_55;
      }
    }
    phoneNumbers = self->_phoneNumbers;
    uint64_t v45 = [v6 phoneNumbers];
    v61 = phoneNumbers;
    BOOL v46 = phoneNumbers == (NSSet *)v45;
    v47 = (NSSet *)v45;
    if (!v46)
    {
      v48 = self->_phoneNumbers;
      v60 = [v6 phoneNumbers];
      if (!-[NSSet isEqualToSet:](v48, "isEqualToSet:"))
      {
        BOOL v10 = 0;
LABEL_51:

LABEL_52:
        uint64_t v43 = (void *)v65;
        if (v63 == (NSSet *)v65) {
          goto LABEL_54;
        }
        goto LABEL_53;
      }
    }
    unint64_t relationship = self->_relationship;
    if (relationship != [v6 relationship] || (unint64_t sex = self->_sex, sex != objc_msgSend(v6, "sex")))
    {
      BOOL v10 = 0;
      goto LABEL_50;
    }
    sourceURLs = self->_sourceURLs;
    [v6 sourceURLs];
    v58 = sourceURLs;
    v59 = (NSArray *)objc_claimAutoreleasedReturnValue();
    if (sourceURLs == v59
      || (v52 = self->_sourceURLs,
          [v6 sourceURLs],
          uint64_t v57 = objc_claimAutoreleasedReturnValue(),
          -[NSArray isEqualToArray:](v52, "isEqualToArray:")))
    {
      int hasContactProfilePicture = self->_hasContactProfilePicture;
      if (hasContactProfilePicture == [v6 hasContactProfilePicture])
      {
        int hasPhoneNumber = self->_hasPhoneNumber;
        BOOL v10 = hasPhoneNumber == [v6 hasPhoneNumber];
      }
      else
      {
        BOOL v10 = 0;
      }
      v53 = (void *)v57;
      if (v58 == v59)
      {

LABEL_50:
        if (v61 == v47) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
    }
    else
    {
      BOOL v10 = 0;
      v53 = (void *)v57;
    }

    goto LABEL_50;
  }
  BOOL v10 = 0;
LABEL_71:

LABEL_72:
  if (fullName != v8) {
    goto LABEL_73;
  }
LABEL_74:

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(CLSPersonIdentity *)self isSamePersonAs:v4];

  return v5;
}

- (id)sourceService
{
  return self->_sourceService;
}

- (void)setSourceService:(id)a3 andID:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ([(NSArray *)self->_sourceURLs count]) {
    __assert_rtn("-[CLSPersonIdentity setSourceService:andID:]", "CLSPersonIdentity.m", 691, "_sourceURLs.count == 0");
  }
  objc_storeStrong((id *)&self->_sourceService, a3);
  char v9 = objc_opt_new();
  [v9 setScheme:v7];
  [v9 setPath:v8];
  uint64_t v10 = [v9 URL];
  char v11 = (void *)v10;
  if (v10)
  {
    v17[0] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    p_super = &self->_sourceURLs->super;
    self->_sourceURLs = v12;
  }
  else
  {
    uint64_t v14 = +[CLSLogging sharedLogging];
    p_super = [v14 loggingConnection];

    if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
    {
      int v15 = 138412290;
      id v16 = v7;
      _os_log_error_impl(&dword_1D2150000, p_super, OS_LOG_TYPE_ERROR, "Trying to set a nil url for source service %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (id)pluralPresentationString
{
  v2 = @"my coworkers";
  switch(self->_relationship)
  {
    case 1uLL:
      break;
    case 2uLL:
    case 3uLL:
      v2 = @"my friends";
      break;
    case 4uLL:
    case 0xDuLL:
      nickname = self->_nickname;
      if (nickname) {
        goto LABEL_5;
      }
      goto LABEL_4;
    case 5uLL:
      v2 = @"my children";
      break;
    case 6uLL:
      v2 = @"my daughters";
      break;
    case 7uLL:
      v2 = @"my sons";
      break;
    case 8uLL:
      v2 = @"my parents";
      break;
    case 9uLL:
      v2 = @"mom";
      break;
    case 0xAuLL:
      v2 = @"dad";
      break;
    case 0xBuLL:
      v2 = @"my brothers";
      break;
    case 0xCuLL:
      v2 = @"my sisters";
      break;
    case 0xEuLL:
      v2 = @"myself";
      break;
    default:
LABEL_4:
      nickname = self->_firstName;
LABEL_5:
      v2 = nickname;
      break;
  }
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = &stru_1F28DF9D8;
  }
  BOOL v5 = v4;

  return v5;
}

- (id)presentationString
{
  v2 = @"my partner";
  switch(self->_relationship)
  {
    case 1uLL:
      firstName = self->_firstName;
      goto LABEL_7;
    case 2uLL:
    case 3uLL:
    case 4uLL:
      firstName = self->_nickname;
      if (!firstName) {
        goto LABEL_3;
      }
      goto LABEL_7;
    case 5uLL:
      v2 = @"my child";
      goto LABEL_8;
    case 6uLL:
      v2 = @"my daughter";
      goto LABEL_8;
    case 7uLL:
      v2 = @"my son";
      goto LABEL_8;
    case 8uLL:
      v2 = @"my parents";
      goto LABEL_8;
    case 9uLL:
      v2 = @"mom";
      goto LABEL_8;
    case 0xAuLL:
      v2 = @"dad";
      goto LABEL_8;
    case 0xBuLL:
      v2 = @"my brother";
      goto LABEL_8;
    case 0xCuLL:
      v2 = @"my sister";
      goto LABEL_8;
    case 0xDuLL:
      goto LABEL_8;
    case 0xEuLL:
      v2 = @"myself";
      goto LABEL_8;
    default:
LABEL_3:
      firstName = self->_firstName;
      if (firstName || (firstName = self->_lastName) != 0) {
LABEL_7:
      }
        v2 = firstName;
      else {
        v2 = 0;
      }
LABEL_8:
      if (v2) {
        id v4 = v2;
      }
      else {
        id v4 = &stru_1F28DF9D8;
      }
      BOOL v5 = v4;

      return v5;
  }
}

- (id)_relationshipAsString
{
  unint64_t v2 = self->_relationship - 1;
  if (v2 > 0x10) {
    return @"Unknown";
  }
  else {
    return off_1E690EDA0[v2];
  }
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"[Person]"];
  if (self->_fullName) {
    [v3 appendFormat:@" fullname:[%@]", self->_fullName];
  }
  if (self->_nickname) {
    [v3 appendFormat:@" nickname:[%@]", self->_nickname];
  }
  id v4 = [(CLSPersonIdentity *)self _relationshipAsString];
  [v3 appendFormat:@" relationship:[%@]", v4];

  if (self->_birthdayDate) {
    [v3 appendFormat:@" birthday:[%@]", self->_birthdayDate];
  }
  if (self->_potentialBirthdayDate) {
    [v3 appendFormat:@" potential birthday:[%@]", self->_potentialBirthdayDate];
  }
  if (self->_anniversaryDate) {
    [v3 appendFormat:@" anniversary:[%@]", self->_anniversaryDate];
  }
  if (self->_companyName) {
    [v3 appendFormat:@" companyName:[%@]", self->_companyName];
  }
  if (self->_localIdentifier) {
    [v3 appendFormat:@" localIdentifier:[%@]", self->_localIdentifier];
  }
  if (self->_CNIdentifier) {
    [v3 appendFormat:@" CNIdentifier:[%@]", self->_CNIdentifier];
  }
  if (self->_GDIdentifier) {
    [v3 appendFormat:@" GDIdentifier:[%@]", self->_GDIdentifier];
  }
  return v3;
}

- (void)enumerateAddressesOfType:(unint64_t)a3 asPlacemarkWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CLSPersonIdentity *)self _addressArrayFromAddressType:a3];
  [(CLSPersonIdentity *)self _enumerateAddresses:v7 as:@"Placemark" withBlock:v6];
}

- (void)enumerateAddressesOfType:(unint64_t)a3 asCLLocationsWithBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(CLSPersonIdentity *)self _addressArrayFromAddressType:a3];
  [(CLSPersonIdentity *)self _enumerateAddresses:v7 as:@"CLLocation" withBlock:v6];
}

- (unint64_t)countOfAddressesOfType:(unint64_t)a3
{
  v3 = [(CLSPersonIdentity *)self _addressArrayFromAddressType:a3];
  unint64_t v4 = [v3 count];

  return v4;
}

- (void)prefetchPersonAddressesIfNeededWithLocationCache:(id)a3
{
  id v4 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __70__CLSPersonIdentity_prefetchPersonAddressesIfNeededWithLocationCache___block_invoke;
  v9[3] = &unk_1E690ECB8;
  id v5 = v4;
  id v10 = v5;
  id v6 = (void (**)(void, void))MEMORY[0x1D2602540](v9);
  id v7 = self->_homeAddresses;
  objc_sync_enter(v7);
  ((void (**)(void, NSMutableArray *))v6)[2](v6, self->_homeAddresses);
  objc_sync_exit(v7);

  id v8 = self->_workAddresses;
  objc_sync_enter(v8);
  ((void (**)(void, NSMutableArray *))v6)[2](v6, self->_workAddresses);
  objc_sync_exit(v8);
}

void __70__CLSPersonIdentity_prefetchPersonAddressesIfNeededWithLocationCache___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count])
  {
    uint64_t v5 = 0;
    *(void *)&long long v4 = 138412290;
    long long v17 = v4;
    uint64_t v18 = a1;
    while (1)
    {
      id v6 = objc_msgSend(v3, "objectAtIndexedSubscript:", v5, v17);
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        goto LABEL_16;
      }
      id v7 = [MEMORY[0x1E4F1CA98] null];
      char v8 = [v6 isEqual:v7];

      if (v8) {
        goto LABEL_16;
      }
      char v9 = +[CLSCachedGeocoderOperation operationWithLocation:v6];
      uint64_t v10 = *(void *)(a1 + 32);
      id v19 = 0;
      char v11 = [v9 performSynchronouslyWithLocationCache:v10 error:&v19];
      id v12 = v19;
      v13 = v12;
      if (v11) {
        break;
      }
      if (v12)
      {
        uint64_t v14 = +[CLSLogging sharedLogging];
        int v15 = [v14 loggingConnection];

        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          v21 = v13;
          _os_log_impl(&dword_1D2150000, v15, OS_LOG_TYPE_DEFAULT, "Failed to prefetch person address error:%@", buf, 0xCu);
        }

        id v16 = [MEMORY[0x1E4F1CA98] null];
        a1 = v18;
        goto LABEL_14;
      }
LABEL_15:

LABEL_16:
      if (++v5 >= (unint64_t)[v3 count]) {
        goto LABEL_17;
      }
    }
    if ([v11 count]) {
      [v11 lastObject];
    }
    else {
    id v16 = [MEMORY[0x1E4F1CA98] null];
    }
LABEL_14:
    [v3 setObject:v16 atIndexedSubscript:v5];

    goto LABEL_15;
  }
LABEL_17:
}

- (void)_enumerateAddresses:(id)a3 as:(id)a4 withBlock:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  char v8 = (__CFString *)a4;
  char v9 = (void (**)(id, void *, unsigned char *))a5;
  id v10 = v7;
  objc_sync_enter(v10);
  char v29 = 0;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v12)
  {
    uint64_t v14 = *(void *)v26;
    *(void *)&long long v13 = 138477827;
    long long v24 = v13;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v25 + 1) + 8 * v15);
        long long v17 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", v24);
        char v18 = [v16 isEqual:v17];

        if (v18) {
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v20 = +[CLSLogging sharedLogging];
          v21 = [v20 loggingConnection];

          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v31 = v16;
            _os_log_error_impl(&dword_1D2150000, v21, OS_LOG_TYPE_ERROR, "You should call prefetch before accessing the person addresses: %{private}@", buf, 0xCu);
          }

          goto LABEL_18;
        }
        if (v8 == @"CLLocation")
        {
          id v22 = [v16 location];
        }
        else
        {
          if (v8 != @"Placemark")
          {
            id v19 = 0;
            goto LABEL_17;
          }
          id v22 = v16;
        }
        id v19 = v22;
LABEL_17:
        v9[2](v9, v19, &v29);
        BOOL v23 = v29 == 0;

        if (!v23) {
          goto LABEL_20;
        }
LABEL_18:
        ++v15;
      }
      while (v12 != v15);
      uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v12);
  }
LABEL_20:

  objc_sync_exit(v11);
}

- (void)addAddresses:(id)a3 ofType:(unint64_t)a4
{
  id v7 = a3;
  id v6 = [(CLSPersonIdentity *)self _addressArrayFromAddressType:a4];
  objc_sync_enter(v6);
  [v6 addObjectsFromArray:v7];
  objc_sync_exit(v6);
}

- (BOOL)hasAddresses
{
  return [(NSMutableArray *)self->_homeAddresses count]
      || [(NSMutableArray *)self->_workAddresses count] != 0;
}

- (id)_addressArrayFromAddressType:(unint64_t)a3
{
  long long v4 = self;
  objc_sync_enter(v4);
  if (a3 == 1)
  {
    p_workAddresses = (void **)&v4->_workAddresses;
    workAddresses = v4->_workAddresses;
    if (!workAddresses)
    {
LABEL_6:
      uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
      char v8 = *p_workAddresses;
      *p_workAddresses = (void *)v7;

      workAddresses = *p_workAddresses;
    }
LABEL_7:
    id v9 = workAddresses;
    goto LABEL_9;
  }
  if (!a3)
  {
    p_workAddresses = (void **)&v4->_homeAddresses;
    workAddresses = v4->_homeAddresses;
    if (!workAddresses) {
      goto LABEL_6;
    }
    goto LABEL_7;
  }
  id v9 = 0;
LABEL_9:
  objc_sync_exit(v4);

  return v9;
}

- (void)mergeWithPerson:(id)a3
{
  v47 = (id *)a3;
  long long v4 = self;
  objc_sync_enter(v4);
  if (!v47) {
    goto LABEL_43;
  }
  if (!v4->_localIdentifier)
  {
    uint64_t v5 = [v47 localIdentifier];
    localIdentifier = v4->_localIdentifier;
    v4->_localIdentifier = (NSString *)v5;
  }
  if (!v4->_CNIdentifier)
  {
    uint64_t v7 = [v47 CNIdentifier];
    CNIdentifier = v4->_CNIdentifier;
    v4->_CNIdentifier = (NSString *)v7;
  }
  if (!v4->_fullName)
  {
    uint64_t v9 = [v47 fullName];
    fullName = v4->_fullName;
    v4->_fullName = (NSString *)v9;
  }
  if (!v4->_firstName)
  {
    uint64_t v11 = [v47 firstName];
    firstName = v4->_firstName;
    v4->_firstName = (NSString *)v11;
  }
  if (!v4->_localizedShortName)
  {
    uint64_t v13 = [v47 localizedShortName];
    localizedShortName = v4->_localizedShortName;
    v4->_localizedShortName = (NSString *)v13;
  }
  if (!v4->_middleName)
  {
    uint64_t v15 = [v47 middleName];
    middleName = v4->_middleName;
    v4->_middleName = (NSString *)v15;
  }
  if (!v4->_lastName)
  {
    uint64_t v17 = [v47 lastName];
    lastName = v4->_lastName;
    v4->_lastName = (NSString *)v17;
  }
  if (!v4->_nickname)
  {
    uint64_t v19 = [v47 nickname];
    nickname = v4->_nickname;
    v4->_nickname = (NSString *)v19;
  }
  if (!v4->_birthdayDate)
  {
    uint64_t v21 = [v47 birthdayDate];
    birthdayDate = v4->_birthdayDate;
    v4->_birthdayDate = (NSDate *)v21;
  }
  if (!v4->_potentialBirthdayDate)
  {
    uint64_t v23 = [v47 potentialBirthdayDate];
    potentialBirthdayDate = v4->_potentialBirthdayDate;
    v4->_potentialBirthdayDate = (NSDate *)v23;
  }
  if (!v4->_anniversaryDate)
  {
    uint64_t v25 = [v47 anniversaryDate];
    anniversaryDate = v4->_anniversaryDate;
    v4->_anniversaryDate = (NSDate *)v25;
  }
  if (!v4->_companyName)
  {
    uint64_t v27 = [v47 companyName];
    companyName = v4->_companyName;
    v4->_companyName = (NSString *)v27;
  }
  [(CLSPersonIdentity *)v4 addAddresses:v47[1] ofType:0];
  [(CLSPersonIdentity *)v4 addAddresses:v47[2] ofType:1];
  if ([v47[20] count])
  {
    uint64_t v29 = [v47[20] setByAddingObjectsFromSet:v4->_emailAddresses];
    emailAddresses = v4->_emailAddresses;
    v4->_emailAddresses = (NSSet *)v29;
  }
  if ([v47[21] count])
  {
    uint64_t v31 = [v47[21] setByAddingObjectsFromSet:v4->_phoneNumbers];
    phoneNumbers = v4->_phoneNumbers;
    v4->_phoneNumbers = (NSSet *)v31;
  }
  uint64_t v33 = [v47 sex];
  unint64_t sex = v4->_sex;
  if (sex)
  {
    if (!v33 || sex == v33) {
      goto LABEL_35;
    }
    uint64_t v33 = 0;
  }
  v4->_unint64_t sex = v33;
LABEL_35:
  long long v35 = [v47 socialProfiles];
  uint64_t v36 = [v35 count];

  if (v36)
  {
    long long v37 = [v47 socialProfiles];
    long long v38 = (NSMutableDictionary *)[v37 mutableCopy];

    [(NSMutableDictionary *)v38 addEntriesFromDictionary:v4->_socialProfiles];
    socialProfiles = v4->_socialProfiles;
    v4->_socialProfiles = v38;
  }
  unint64_t relationship = v4->_relationship;
  if (relationship < [v47 relationship]) {
    v4->_unint64_t relationship = [v47 relationship];
  }
  sourceURLs = v4->_sourceURLs;
  v42 = [v47 sourceURLs];
  uint64_t v43 = [(NSArray *)sourceURLs arrayByAddingObjectsFromArray:v42];
  v44 = v4->_sourceURLs;
  v4->_sourceURLs = (NSArray *)v43;

  v4->_hasContactProfilePicture |= [v47 hasContactProfilePicture];
  if (!v4->_hasPhoneNumber) {
    v4->_int hasPhoneNumber = [v47 hasPhoneNumber];
  }
  if (!v4->_shareParticipantLocalIdentifier)
  {
    uint64_t v45 = [v47 shareParticipantLocalIdentifier];
    shareParticipantLocalIdentifier = v4->_shareParticipantLocalIdentifier;
    v4->_shareParticipantLocalIdentifier = (NSString *)v45;
  }
LABEL_43:
  objc_sync_exit(v4);
}

- (BOOL)isSamePersonAs:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  localIdentifier = self->_localIdentifier;
  if (localIdentifier)
  {
    uint64_t v7 = [v4 localIdentifier];
    uint64_t v8 = [(NSString *)localIdentifier compare:v7 options:385];

    if (!v8) {
      goto LABEL_13;
    }
  }
  CNIdentifier = self->_CNIdentifier;
  if (CNIdentifier)
  {
    id v10 = [v5 CNIdentifier];
    uint64_t v11 = [(NSString *)CNIdentifier compare:v10 options:385];

    if (!v11) {
      goto LABEL_13;
    }
  }
  fullName = self->_fullName;
  if (fullName)
  {
    uint64_t v13 = [v5 fullName];
    uint64_t v14 = [(NSString *)fullName compare:v13 options:385];

    if (!v14) {
      goto LABEL_13;
    }
  }
  firstName = self->_firstName;
  if (!firstName || !self->_lastName) {
    goto LABEL_12;
  }
  id v16 = [v5 firstName];
  if ([(NSString *)firstName compare:v16 options:385] == NSOrderedSame)
  {
    lastName = self->_lastName;
    char v18 = [v5 lastName];
    uint64_t v19 = [(NSString *)lastName compare:v18 options:385];

    if (v19) {
      goto LABEL_12;
    }
LABEL_13:
    char v22 = 1;
    goto LABEL_14;
  }

LABEL_12:
  emailAddresses = self->_emailAddresses;
  uint64_t v21 = [v5 emailAddresses];
  char v22 = [(NSSet *)emailAddresses intersectsSet:v21];

LABEL_14:
  return v22;
}

- (BOOL)isMe
{
  return self->_relationship == 14;
}

- (void)setCompanyName:(id)a3
{
  self->_companyName = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (void)setNickname:(id)a3
{
  self->_nickname = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (void)setLastName:(id)a3
{
  self->_lastName = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (void)setMiddleName:(id)a3
{
  self->_middleName = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (void)setLocalizedShortName:(id)a3
{
  self->_localizedShortName = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (void)setFirstName:(id)a3
{
  self->_firstName = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (void)setFullName:(id)a3
{
  self->_fullName = [a3 decomposedStringWithCanonicalMapping];
  MEMORY[0x1F41817F8]();
}

- (CLSPersonIdentity)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSPersonIdentity;
  unint64_t v2 = [(CLSPersonIdentity *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    sourceURLs = v2->_sourceURLs;
    v2->_sourceURLs = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  return v3;
}

- (CLSPersonIdentity)initWithCoder:(id)a3
{
  id v4 = a3;
  v70.receiver = self;
  v70.super_class = (Class)CLSPersonIdentity;
  uint64_t v5 = [(CLSPersonIdentity *)&v70 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"PHIdentifier"];
    localIdentifier = v5->_localIdentifier;
    v5->_localIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CNIdentifier"];
    CNIdentifier = v5->_CNIdentifier;
    v5->_CNIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ShareParticipantLocalIdentifier"];
    shareParticipantLocalIdentifier = v5->_shareParticipantLocalIdentifier;
    v5->_shareParticipantLocalIdentifier = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"firstName"];
    firstName = v5->_firstName;
    v5->_firstName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedShortName"];
    localizedShortName = v5->_localizedShortName;
    v5->_localizedShortName = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"middleName"];
    middleName = v5->_middleName;
    v5->_middleName = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lastName"];
    lastName = v5->_lastName;
    v5->_lastName = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nickname"];
    nickname = v5->_nickname;
    v5->_nickname = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"birthdayDate"];
    birthdayDate = v5->_birthdayDate;
    v5->_birthdayDate = (NSDate *)v24;

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"potentialBirthdayDate"];
    potentialBirthdayDate = v5->_potentialBirthdayDate;
    v5->_potentialBirthdayDate = (NSDate *)v26;

    uint64_t v28 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"anniversaryDate"];
    anniversaryDate = v5->_anniversaryDate;
    v5->_anniversaryDate = (NSDate *)v28;

    uint64_t v30 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"companyName"];
    companyName = v5->_companyName;
    v5->_companyName = (NSString *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v33 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    long long v35 = objc_msgSend(v32, "setWithObjects:", v33, v34, objc_opt_class(), 0);
    uint64_t v36 = [v4 decodeObjectOfClasses:v35 forKey:@"socialProfiles"];
    socialProfiles = v5->_socialProfiles;
    v5->_socialProfiles = (NSMutableDictionary *)v36;

    long long v38 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v39 = objc_opt_class();
    uint64_t v40 = objc_opt_class();
    v41 = objc_msgSend(v38, "setWithObjects:", v39, v40, objc_opt_class(), 0);
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"emailAddresses"];
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSSet *)v42;

    v44 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v45 = objc_opt_class();
    uint64_t v46 = objc_opt_class();
    v47 = objc_msgSend(v44, "setWithObjects:", v45, v46, objc_opt_class(), 0);
    uint64_t v48 = [v4 decodeObjectOfClasses:v47 forKey:@"phoneNumbers"];
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSSet *)v48;

    v5->_unint64_t relationship = [v4 decodeIntegerForKey:@"relationship"];
    v5->_unint64_t sex = [v4 decodeIntegerForKey:@"sex"];
    v5->_ageCategory = [v4 decodeIntegerForKey:@"ageCategory"];
    v50 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v51 = objc_opt_class();
    v52 = objc_msgSend(v50, "setWithObjects:", v51, objc_opt_class(), 0);
    uint64_t v53 = [v4 decodeObjectOfClasses:v52 forKey:@"sourceURLs"];
    sourceURLs = v5->_sourceURLs;
    v5->_sourceURLs = (NSArray *)v53;

    v5->_int hasContactProfilePicture = [v4 decodeBoolForKey:@"hasContactProfilePicture"];
    v5->_int hasPhoneNumber = [v4 decodeBoolForKey:@"hasPhoneNumber"];
    v55 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v56 = objc_opt_class();
    uint64_t v57 = objc_opt_class();
    uint64_t v58 = objc_opt_class();
    v59 = objc_msgSend(v55, "setWithObjects:", v56, v57, v58, objc_opt_class(), 0);
    uint64_t v60 = [v4 decodeObjectOfClasses:v59 forKey:@"homeAddresses"];
    homeAddresses = v5->_homeAddresses;
    v5->_homeAddresses = (NSMutableArray *)v60;

    v62 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v63 = objc_opt_class();
    uint64_t v64 = objc_opt_class();
    uint64_t v65 = objc_opt_class();
    v66 = objc_msgSend(v62, "setWithObjects:", v63, v64, v65, objc_opt_class(), 0);
    uint64_t v67 = [v4 decodeObjectOfClasses:v66 forKey:@"workAddresses"];
    workAddresses = v5->_workAddresses;
    v5->_workAddresses = (NSMutableArray *)v67;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  localIdentifier = self->_localIdentifier;
  id v5 = a3;
  [v5 encodeObject:localIdentifier forKey:@"PHIdentifier"];
  [v5 encodeObject:self->_CNIdentifier forKey:@"CNIdentifier"];
  [v5 encodeObject:self->_shareParticipantLocalIdentifier forKey:@"ShareParticipantLocalIdentifier"];
  [v5 encodeObject:self->_fullName forKey:@"fullName"];
  [v5 encodeObject:self->_firstName forKey:@"firstName"];
  [v5 encodeObject:self->_localizedShortName forKey:@"localizedShortName"];
  [v5 encodeObject:self->_middleName forKey:@"middleName"];
  [v5 encodeObject:self->_lastName forKey:@"lastName"];
  [v5 encodeObject:self->_nickname forKey:@"nickname"];
  [v5 encodeObject:self->_birthdayDate forKey:@"birthdayDate"];
  [v5 encodeObject:self->_potentialBirthdayDate forKey:@"potentialBirthdayDate"];
  [v5 encodeObject:self->_anniversaryDate forKey:@"anniversaryDate"];
  [v5 encodeObject:self->_companyName forKey:@"companyName"];
  [v5 encodeObject:self->_socialProfiles forKey:@"socialProfiles"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
  [v5 encodeInteger:self->_relationship forKey:@"relationship"];
  [v5 encodeInteger:self->_sex forKey:@"sex"];
  [v5 encodeInteger:self->_ageCategory forKey:@"ageCategory"];
  [v5 encodeObject:self->_sourceURLs forKey:@"sourceURLs"];
  [v5 encodeObject:self->_homeAddresses forKey:@"homeAddresses"];
  [v5 encodeObject:self->_workAddresses forKey:@"workAddresses"];
  [v5 encodeBool:self->_hasContactProfilePicture forKey:@"hasContactProfilePicture"];
  [v5 encodeBool:self->_hasPhoneNumber forKey:@"hasPhoneNumber"];
}

+ (id)descriptionForPersonRelationship:(unint64_t)a3
{
  id v3 = @"father";
  if (a3 != 10) {
    id v3 = 0;
  }
  if (a3 == 9) {
    return @"mother";
  }
  else {
    return v3;
  }
}

+ (id)relationshipRegularExpressionForRelationship:(unint64_t)a3 locale:(id)a4
{
  uint64_t v6 = [a4 languageCode];
  if (relationshipRegularExpressionForRelationship_locale__onceToken != -1) {
    dispatch_once(&relationshipRegularExpressionForRelationship_locale__onceToken, &__block_literal_global_986);
  }
  uint64_t v7 = [(id)relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale objectForKey:v6];
  if (!v7)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v9 = [(id)objc_opt_class() _personRelationshipVocabularyByLocaleDictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:v6];
    if (v10)
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __73__CLSPersonIdentity_relationshipRegularExpressionForRelationship_locale___block_invoke_2;
      uint64_t v19 = &unk_1E6910420;
      id v11 = v8;
      id v20 = v11;
      id v12 = v6;
      id v21 = v12;
      [v10 enumerateKeysAndObjectsUsingBlock:&v16];
      uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithDictionary:", v11, v16, v17, v18, v19);
      [(id)relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale setObject:v7 forKey:v12];
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  uint64_t v13 = [a1 descriptionForPersonRelationship:a3];
  if (v13)
  {
    uint64_t v14 = [v7 objectForKeyedSubscript:v13];
  }
  else
  {
    uint64_t v14 = 0;
  }

  return v14;
}

void __73__CLSPersonIdentity_relationshipRegularExpressionForRelationship_locale___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = NSString;
  id v6 = a2;
  uint64_t v7 = [a3 componentsJoinedByString:@"|"];
  uint64_t v8 = [v5 stringWithFormat:@"^(%@)$", v7];

  id v11 = 0;
  uint64_t v9 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:v8 options:1 error:&v11];
  id v10 = v11;
  if (v10) {
    NSLog(&cfstr_ErrorCreatingR.isa, *(void *)(a1 + 40), v6);
  }
  else {
    [*(id *)(a1 + 32) setObject:v9 forKeyedSubscript:v6];
  }
}

uint64_t __73__CLSPersonIdentity_relationshipRegularExpressionForRelationship_locale___block_invoke()
{
  relationshipRegularExpressionForRelationship_locale__cachedRegularExpressionByRelationshipByLocale = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)_personRelationshipVocabularyByLocaleDictionary
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__CLSPersonIdentity__personRelationshipVocabularyByLocaleDictionary__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_personRelationshipVocabularyByLocaleDictionary_onceToken != -1) {
    dispatch_once(&_personRelationshipVocabularyByLocaleDictionary_onceToken, block);
  }
  unint64_t v2 = (void *)_personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
  return v2;
}

void __68__CLSPersonIdentity__personRelationshipVocabularyByLocaleDictionary__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v3 = [v0 URLForResource:@"personRelationshipVocabulary" withExtension:@"plist"];

  uint64_t v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v3];
  unint64_t v2 = (void *)_personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary;
  _personRelationshipVocabularyByLocaleDictionary_sPersonRelationshipVocabularyByLocaleDictionary = v1;
}

+ (BOOL)isFamilyRelationship:(unint64_t)a3
{
  if (a3 == 4
    || (objc_msgSend(a1, "isSiblingRelationship:") & 1) != 0
    || ([a1 isChildRelationship:a3] & 1) != 0)
  {
    return 1;
  }
  return [a1 isParentRelationship:a3];
}

+ (BOOL)isSiblingRelationship:(unint64_t)a3
{
  return a3 - 11 < 2;
}

+ (BOOL)isChildRelationship:(unint64_t)a3
{
  return a3 - 5 < 3;
}

+ (BOOL)isParentRelationship:(unint64_t)a3
{
  return a3 == 10 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 8;
}

+ (id)presentationStringForPeople:(id)a3 withScores:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__989;
  uint64_t v33 = __Block_byref_object_dispose__990;
  id v34 = 0;
  uint64_t v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
  id v10 = [MEMORY[0x1E4F1CA48] array];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  id v12 = _sortedPeopleByScores(v6, v7);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke;
  v23[3] = &unk_1E690ED80;
  id v13 = v9;
  id v24 = v13;
  uint64_t v27 = &v29;
  id v28 = a1;
  id v14 = v8;
  id v25 = v14;
  id v15 = v10;
  id v26 = v15;
  [v12 enumerateObjectsUsingBlock:v23];
  if (v30[5]) {
    [v11 addObject:@"my wife"];
  }
  if ((unint64_t)[v14 count] > 4
    || [v14 count] && (unint64_t)objc_msgSend(v6, "count") >= 9)
  {
    [v11 addObject:@"my family"];
  }
  else
  {
    uint64_t v16 = _familyPresentationStringsForPersons(v14);
    [v11 addObjectsFromArray:v16];
  }
  if ((unint64_t)[v13 count] > 4
    || [v13 count] && (unint64_t)objc_msgSend(v6, "count") >= 9)
  {
    [v11 addObject:@"my friends"];
  }
  else
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_2;
    v21[3] = &unk_1E690ED08;
    id v22 = v11;
    [v13 enumerateObjectsUsingBlock:v21];
  }
  if ((unint64_t)[v15 count] > 4
    || [v15 count] && (unint64_t)objc_msgSend(v6, "count") >= 9)
  {
    [v11 addObject:@"my coworkers"];
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_3;
    v19[3] = &unk_1E690ED08;
    id v20 = v11;
    [v15 enumerateObjectsUsingBlock:v19];
  }
  uint64_t v17 = _flattenPresentationStringFromTokens(v11);

  _Block_object_dispose(&v29, 8);
  return v17;
}

void __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if ([v5 relationship] == 2)
  {
    id v4 = *(void **)(a1 + 32);
  }
  else
  {
    if ([v5 relationship] == 13)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
      goto LABEL_10;
    }
    if (objc_msgSend(*(id *)(a1 + 64), "isFamilyRelationship:", objc_msgSend(v5, "relationship")))
    {
      id v4 = *(void **)(a1 + 40);
    }
    else
    {
      if ([v5 relationship] != 1) {
        goto LABEL_10;
      }
      id v4 = *(void **)(a1 + 48);
    }
  }
  [v4 addObject:v5];
LABEL_10:
}

void __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_2(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 presentationString];
  [v2 addObject:v3];
}

void __60__CLSPersonIdentity_presentationStringForPeople_withScores___block_invoke_3(uint64_t a1, void *a2)
{
  unint64_t v2 = *(void **)(a1 + 32);
  id v3 = [a2 presentationString];
  [v2 addObject:v3];
}

+ (id)presentationStringForPeople:(id)a3
{
  return (id)[a1 presentationStringForPeople:a3 withScores:MEMORY[0x1E4F1CBF0]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)personWithGDIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(CLSPersonIdentity);
  [(CLSPersonIdentity *)v4 setGDIdentifier:v3];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Creating person with GDIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  return v4;
}

+ (id)personWithPHPerson:(id)a3
{
  id v3 = a3;
  id v4 = [v3 localIdentifier];
  id v5 = +[CLSPersonIdentity personWithLocalIdentifier:v4];

  int v6 = [v3 name];
  [v5 setFullName:v6];

  id v7 = [v3 personUri];
  [v5 setCNIdentifier:v7];

  objc_msgSend(v5, "setIsUserCreated:", objc_msgSend(v3, "isVerified"));
  objc_msgSend(v5, "setIsFavorite:", objc_msgSend(v3, "type") == 1);
  objc_msgSend(v5, "setIsHidden:", objc_msgSend(v3, "type") == -1);
  uint64_t v8 = [v3 localIdentifier];

  [v5 setSourceService:@"photoskit" andID:v8];
  return v5;
}

+ (id)personWithLocalIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(CLSPersonIdentity);
  [(CLSPersonIdentity *)v4 setLocalIdentifier:v3];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Creating person with localIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  return v4;
}

+ (id)personWithCNIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(CLSPersonIdentity);
  [(CLSPersonIdentity *)v4 setCNIdentifier:v3];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Creating person with CNIdentifier: %@", (uint8_t *)&v6, 0xCu);
  }

  return v4;
}

+ (id)mePerson
{
  unint64_t v2 = objc_alloc_init(CLSPersonIdentity);
  [(CLSPersonIdentity *)v2 setRelationship:14];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1D2150000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Creating blank me person", v4, 2u);
  }
  return v2;
}

+ (id)person
{
  id v3 = objc_msgSend(NSString, "cls_generateUUID");
  id v4 = [a1 personWithLocalIdentifier:v3];

  return v4;
}

@end