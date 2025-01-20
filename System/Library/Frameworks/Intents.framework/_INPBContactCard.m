@interface _INPBContactCard
+ (BOOL)supportsSecureCoding;
+ (Class)contactRelationsType;
+ (Class)datesType;
+ (Class)emailAddressesType;
+ (Class)instantMessageAddressesType;
+ (Class)phoneNumbersType;
+ (Class)postalAddressesType;
+ (Class)urlAddressesType;
- (BOOL)hasBirthday;
- (BOOL)hasContactIdentifier;
- (BOOL)hasDepartmentName;
- (BOOL)hasFirstName;
- (BOOL)hasFullName;
- (BOOL)hasImage;
- (BOOL)hasIsMe;
- (BOOL)hasJobTitle;
- (BOOL)hasLastName;
- (BOOL)hasMiddleName;
- (BOOL)hasNamePrefix;
- (BOOL)hasNameSuffix;
- (BOOL)hasNickName;
- (BOOL)hasNonGregorianBirthday;
- (BOOL)hasOrganizationName;
- (BOOL)hasPhoneticFirstName;
- (BOOL)hasPhoneticLastName;
- (BOOL)hasPhoneticMiddleName;
- (BOOL)hasPhoneticNamePrefix;
- (BOOL)hasPhoneticNameSuffix;
- (BOOL)hasPhoneticNickName;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (BOOL)readFrom:(id)a3;
- (NSArray)contactRelations;
- (NSArray)dates;
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)urlAddresses;
- (NSString)contactIdentifier;
- (NSString)departmentName;
- (NSString)firstName;
- (NSString)fullName;
- (NSString)jobTitle;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickName;
- (NSString)organizationName;
- (NSString)phoneticFirstName;
- (NSString)phoneticLastName;
- (NSString)phoneticMiddleName;
- (NSString)phoneticNamePrefix;
- (NSString)phoneticNameSuffix;
- (NSString)phoneticNickName;
- (_INPBContactCard)initWithCoder:(id)a3;
- (_INPBDateTimeRangeValue)birthday;
- (_INPBDateTimeRangeValue)nonGregorianBirthday;
- (_INPBImageValue)image;
- (id)contactRelationsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)datesAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)emailAddressesAtIndex:(unint64_t)a3;
- (id)instantMessageAddressesAtIndex:(unint64_t)a3;
- (id)phoneNumbersAtIndex:(unint64_t)a3;
- (id)postalAddressesAtIndex:(unint64_t)a3;
- (id)urlAddressesAtIndex:(unint64_t)a3;
- (unint64_t)contactRelationsCount;
- (unint64_t)datesCount;
- (unint64_t)emailAddressesCount;
- (unint64_t)hash;
- (unint64_t)instantMessageAddressesCount;
- (unint64_t)phoneNumbersCount;
- (unint64_t)postalAddressesCount;
- (unint64_t)urlAddressesCount;
- (void)addContactRelations:(id)a3;
- (void)addDates:(id)a3;
- (void)addEmailAddresses:(id)a3;
- (void)addInstantMessageAddresses:(id)a3;
- (void)addPhoneNumbers:(id)a3;
- (void)addPostalAddresses:(id)a3;
- (void)addUrlAddresses:(id)a3;
- (void)clearContactRelations;
- (void)clearDates;
- (void)clearEmailAddresses;
- (void)clearInstantMessageAddresses;
- (void)clearPhoneNumbers;
- (void)clearPostalAddresses;
- (void)clearUrlAddresses;
- (void)encodeWithCoder:(id)a3;
- (void)setBirthday:(id)a3;
- (void)setContactIdentifier:(id)a3;
- (void)setContactRelations:(id)a3;
- (void)setDates:(id)a3;
- (void)setDepartmentName:(id)a3;
- (void)setEmailAddresses:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFullName:(id)a3;
- (void)setHasIsMe:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setInstantMessageAddresses:(id)a3;
- (void)setIsMe:(BOOL)a3;
- (void)setJobTitle:(id)a3;
- (void)setLastName:(id)a3;
- (void)setMiddleName:(id)a3;
- (void)setNamePrefix:(id)a3;
- (void)setNameSuffix:(id)a3;
- (void)setNickName:(id)a3;
- (void)setNonGregorianBirthday:(id)a3;
- (void)setOrganizationName:(id)a3;
- (void)setPhoneNumbers:(id)a3;
- (void)setPhoneticFirstName:(id)a3;
- (void)setPhoneticLastName:(id)a3;
- (void)setPhoneticMiddleName:(id)a3;
- (void)setPhoneticNamePrefix:(id)a3;
- (void)setPhoneticNameSuffix:(id)a3;
- (void)setPhoneticNickName:(id)a3;
- (void)setPostalAddresses:(id)a3;
- (void)setUrlAddresses:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _INPBContactCard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneticNickName, 0);
  objc_storeStrong((id *)&self->_phoneticNameSuffix, 0);
  objc_storeStrong((id *)&self->_phoneticNamePrefix, 0);
  objc_storeStrong((id *)&self->_phoneticMiddleName, 0);
  objc_storeStrong((id *)&self->_phoneticLastName, 0);
  objc_storeStrong((id *)&self->_phoneticFirstName, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_nonGregorianBirthday, 0);
  objc_storeStrong((id *)&self->_nickName, 0);
  objc_storeStrong((id *)&self->_nameSuffix, 0);
  objc_storeStrong((id *)&self->_namePrefix, 0);
  objc_storeStrong((id *)&self->_middleName, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_fullName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_contactRelations, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);

  objc_storeStrong((id *)&self->_birthday, 0);
}

- (NSArray)urlAddresses
{
  return self->_urlAddresses;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSString)phoneticNickName
{
  return self->_phoneticNickName;
}

- (NSString)phoneticNameSuffix
{
  return self->_phoneticNameSuffix;
}

- (NSString)phoneticNamePrefix
{
  return self->_phoneticNamePrefix;
}

- (NSString)phoneticMiddleName
{
  return self->_phoneticMiddleName;
}

- (NSString)phoneticLastName
{
  return self->_phoneticLastName;
}

- (NSString)phoneticFirstName
{
  return self->_phoneticFirstName;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (_INPBDateTimeRangeValue)nonGregorianBirthday
{
  return self->_nonGregorianBirthday;
}

- (NSString)nickName
{
  return self->_nickName;
}

- (NSString)nameSuffix
{
  return self->_nameSuffix;
}

- (NSString)namePrefix
{
  return self->_namePrefix;
}

- (NSString)middleName
{
  return self->_middleName;
}

- (NSString)lastName
{
  return self->_lastName;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (_INPBImageValue)image
{
  return self->_image;
}

- (NSString)fullName
{
  return self->_fullName;
}

- (NSString)firstName
{
  return self->_firstName;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)departmentName
{
  return self->_departmentName;
}

- (NSArray)dates
{
  return self->_dates;
}

- (NSArray)contactRelations
{
  return self->_contactRelations;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (_INPBDateTimeRangeValue)birthday
{
  return self->_birthday;
}

- (id)dictionaryRepresentation
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(_INPBContactCard *)self birthday];
  v5 = [v4 dictionaryRepresentation];
  [v3 setObject:v5 forKeyedSubscript:@"birthday"];

  if (self->_contactIdentifier)
  {
    v6 = [(_INPBContactCard *)self contactIdentifier];
    v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"contactIdentifier"];
  }
  if ([(NSArray *)self->_contactRelations count])
  {
    v8 = [MEMORY[0x1E4F1CA48] array];
    long long v120 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    long long v123 = 0u;
    v9 = self->_contactRelations;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v120 objects:v130 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v121;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v121 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [*(id *)(*((void *)&v120 + 1) + 8 * v13) dictionaryRepresentation];
          [v8 addObject:v14];

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [(NSArray *)v9 countByEnumeratingWithState:&v120 objects:v130 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKeyedSubscript:@"contactRelations"];
  }
  if ([(NSArray *)self->_dates count])
  {
    v15 = [MEMORY[0x1E4F1CA48] array];
    long long v116 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v16 = self->_dates;
    uint64_t v17 = [(NSArray *)v16 countByEnumeratingWithState:&v116 objects:v129 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v117;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v117 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v116 + 1) + 8 * v20) dictionaryRepresentation];
          [v15 addObject:v21];

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [(NSArray *)v16 countByEnumeratingWithState:&v116 objects:v129 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKeyedSubscript:@"dates"];
  }
  if (self->_departmentName)
  {
    v22 = [(_INPBContactCard *)self departmentName];
    v23 = (void *)[v22 copy];
    [v3 setObject:v23 forKeyedSubscript:@"departmentName"];
  }
  if ([(NSArray *)self->_emailAddresses count])
  {
    v24 = [MEMORY[0x1E4F1CA48] array];
    long long v112 = 0u;
    long long v113 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    v25 = self->_emailAddresses;
    uint64_t v26 = [(NSArray *)v25 countByEnumeratingWithState:&v112 objects:v128 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v113;
      do
      {
        uint64_t v29 = 0;
        do
        {
          if (*(void *)v113 != v28) {
            objc_enumerationMutation(v25);
          }
          v30 = [*(id *)(*((void *)&v112 + 1) + 8 * v29) dictionaryRepresentation];
          [v24 addObject:v30];

          ++v29;
        }
        while (v27 != v29);
        uint64_t v27 = [(NSArray *)v25 countByEnumeratingWithState:&v112 objects:v128 count:16];
      }
      while (v27);
    }

    [v3 setObject:v24 forKeyedSubscript:@"emailAddresses"];
  }
  if (self->_firstName)
  {
    v31 = [(_INPBContactCard *)self firstName];
    v32 = (void *)[v31 copy];
    [v3 setObject:v32 forKeyedSubscript:@"firstName"];
  }
  if (self->_fullName)
  {
    v33 = [(_INPBContactCard *)self fullName];
    v34 = (void *)[v33 copy];
    [v3 setObject:v34 forKeyedSubscript:@"fullName"];
  }
  v35 = [(_INPBContactCard *)self image];
  v36 = [v35 dictionaryRepresentation];
  [v3 setObject:v36 forKeyedSubscript:@"image"];

  if ([(NSArray *)self->_instantMessageAddresses count])
  {
    v37 = [MEMORY[0x1E4F1CA48] array];
    long long v108 = 0u;
    long long v109 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    v38 = self->_instantMessageAddresses;
    uint64_t v39 = [(NSArray *)v38 countByEnumeratingWithState:&v108 objects:v127 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v109;
      do
      {
        uint64_t v42 = 0;
        do
        {
          if (*(void *)v109 != v41) {
            objc_enumerationMutation(v38);
          }
          v43 = [*(id *)(*((void *)&v108 + 1) + 8 * v42) dictionaryRepresentation];
          [v37 addObject:v43];

          ++v42;
        }
        while (v40 != v42);
        uint64_t v40 = [(NSArray *)v38 countByEnumeratingWithState:&v108 objects:v127 count:16];
      }
      while (v40);
    }

    [v3 setObject:v37 forKeyedSubscript:@"instantMessageAddresses"];
  }
  if ([(_INPBContactCard *)self hasIsMe])
  {
    v44 = objc_msgSend(NSNumber, "numberWithBool:", -[_INPBContactCard isMe](self, "isMe"));
    [v3 setObject:v44 forKeyedSubscript:@"isMe"];
  }
  if (self->_jobTitle)
  {
    v45 = [(_INPBContactCard *)self jobTitle];
    v46 = (void *)[v45 copy];
    [v3 setObject:v46 forKeyedSubscript:@"jobTitle"];
  }
  if (self->_lastName)
  {
    v47 = [(_INPBContactCard *)self lastName];
    v48 = (void *)[v47 copy];
    [v3 setObject:v48 forKeyedSubscript:@"lastName"];
  }
  if (self->_middleName)
  {
    v49 = [(_INPBContactCard *)self middleName];
    v50 = (void *)[v49 copy];
    [v3 setObject:v50 forKeyedSubscript:@"middleName"];
  }
  if (self->_namePrefix)
  {
    v51 = [(_INPBContactCard *)self namePrefix];
    v52 = (void *)[v51 copy];
    [v3 setObject:v52 forKeyedSubscript:@"namePrefix"];
  }
  if (self->_nameSuffix)
  {
    v53 = [(_INPBContactCard *)self nameSuffix];
    v54 = (void *)[v53 copy];
    [v3 setObject:v54 forKeyedSubscript:@"nameSuffix"];
  }
  if (self->_nickName)
  {
    v55 = [(_INPBContactCard *)self nickName];
    v56 = (void *)[v55 copy];
    [v3 setObject:v56 forKeyedSubscript:@"nickName"];
  }
  v57 = [(_INPBContactCard *)self nonGregorianBirthday];
  v58 = [v57 dictionaryRepresentation];
  [v3 setObject:v58 forKeyedSubscript:@"nonGregorianBirthday"];

  if (self->_organizationName)
  {
    v59 = [(_INPBContactCard *)self organizationName];
    v60 = (void *)[v59 copy];
    [v3 setObject:v60 forKeyedSubscript:@"organizationName"];
  }
  if ([(NSArray *)self->_phoneNumbers count])
  {
    v61 = [MEMORY[0x1E4F1CA48] array];
    long long v104 = 0u;
    long long v105 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    v62 = self->_phoneNumbers;
    uint64_t v63 = [(NSArray *)v62 countByEnumeratingWithState:&v104 objects:v126 count:16];
    if (v63)
    {
      uint64_t v64 = v63;
      uint64_t v65 = *(void *)v105;
      do
      {
        uint64_t v66 = 0;
        do
        {
          if (*(void *)v105 != v65) {
            objc_enumerationMutation(v62);
          }
          v67 = [*(id *)(*((void *)&v104 + 1) + 8 * v66) dictionaryRepresentation];
          [v61 addObject:v67];

          ++v66;
        }
        while (v64 != v66);
        uint64_t v64 = [(NSArray *)v62 countByEnumeratingWithState:&v104 objects:v126 count:16];
      }
      while (v64);
    }

    [v3 setObject:v61 forKeyedSubscript:@"phoneNumbers"];
  }
  if (self->_phoneticFirstName)
  {
    v68 = [(_INPBContactCard *)self phoneticFirstName];
    v69 = (void *)[v68 copy];
    [v3 setObject:v69 forKeyedSubscript:@"phoneticFirstName"];
  }
  if (self->_phoneticLastName)
  {
    v70 = [(_INPBContactCard *)self phoneticLastName];
    v71 = (void *)[v70 copy];
    [v3 setObject:v71 forKeyedSubscript:@"phoneticLastName"];
  }
  if (self->_phoneticMiddleName)
  {
    v72 = [(_INPBContactCard *)self phoneticMiddleName];
    v73 = (void *)[v72 copy];
    [v3 setObject:v73 forKeyedSubscript:@"phoneticMiddleName"];
  }
  if (self->_phoneticNamePrefix)
  {
    v74 = [(_INPBContactCard *)self phoneticNamePrefix];
    v75 = (void *)[v74 copy];
    [v3 setObject:v75 forKeyedSubscript:@"phoneticNamePrefix"];
  }
  if (self->_phoneticNameSuffix)
  {
    v76 = [(_INPBContactCard *)self phoneticNameSuffix];
    v77 = (void *)[v76 copy];
    [v3 setObject:v77 forKeyedSubscript:@"phoneticNameSuffix"];
  }
  if (self->_phoneticNickName)
  {
    v78 = [(_INPBContactCard *)self phoneticNickName];
    v79 = (void *)[v78 copy];
    [v3 setObject:v79 forKeyedSubscript:@"phoneticNickName"];
  }
  if ([(NSArray *)self->_postalAddresses count])
  {
    v80 = [MEMORY[0x1E4F1CA48] array];
    long long v100 = 0u;
    long long v101 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    v81 = self->_postalAddresses;
    uint64_t v82 = [(NSArray *)v81 countByEnumeratingWithState:&v100 objects:v125 count:16];
    if (v82)
    {
      uint64_t v83 = v82;
      uint64_t v84 = *(void *)v101;
      do
      {
        uint64_t v85 = 0;
        do
        {
          if (*(void *)v101 != v84) {
            objc_enumerationMutation(v81);
          }
          v86 = [*(id *)(*((void *)&v100 + 1) + 8 * v85) dictionaryRepresentation];
          [v80 addObject:v86];

          ++v85;
        }
        while (v83 != v85);
        uint64_t v83 = [(NSArray *)v81 countByEnumeratingWithState:&v100 objects:v125 count:16];
      }
      while (v83);
    }

    [v3 setObject:v80 forKeyedSubscript:@"postalAddresses"];
  }
  if ([(NSArray *)self->_urlAddresses count])
  {
    v87 = [MEMORY[0x1E4F1CA48] array];
    long long v96 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    v88 = self->_urlAddresses;
    uint64_t v89 = [(NSArray *)v88 countByEnumeratingWithState:&v96 objects:v124 count:16];
    if (v89)
    {
      uint64_t v90 = v89;
      uint64_t v91 = *(void *)v97;
      do
      {
        uint64_t v92 = 0;
        do
        {
          if (*(void *)v97 != v91) {
            objc_enumerationMutation(v88);
          }
          v93 = objc_msgSend(*(id *)(*((void *)&v96 + 1) + 8 * v92), "dictionaryRepresentation", (void)v96);
          [v87 addObject:v93];

          ++v92;
        }
        while (v90 != v92);
        uint64_t v90 = [(NSArray *)v88 countByEnumeratingWithState:&v96 objects:v124 count:16];
      }
      while (v90);
    }

    [v3 setObject:v87 forKeyedSubscript:@"urlAddresses"];
  }
  id v94 = v3;

  return v94;
}

- (unint64_t)hash
{
  unint64_t v31 = [(_INPBDateTimeRangeValue *)self->_birthday hash];
  NSUInteger v3 = [(NSString *)self->_contactIdentifier hash];
  uint64_t v4 = [(NSArray *)self->_contactRelations hash];
  uint64_t v5 = [(NSArray *)self->_dates hash];
  NSUInteger v6 = [(NSString *)self->_departmentName hash];
  uint64_t v7 = [(NSArray *)self->_emailAddresses hash];
  NSUInteger v8 = [(NSString *)self->_firstName hash];
  NSUInteger v9 = [(NSString *)self->_fullName hash];
  unint64_t v10 = [(_INPBImageValue *)self->_image hash];
  uint64_t v11 = [(NSArray *)self->_instantMessageAddresses hash];
  if ([(_INPBContactCard *)self hasIsMe]) {
    uint64_t v12 = 2654435761 * self->_isMe;
  }
  else {
    uint64_t v12 = 0;
  }
  NSUInteger v13 = v3 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  NSUInteger v14 = [(NSString *)self->_jobTitle hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_lastName hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_middleName hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_namePrefix hash];
  NSUInteger v18 = v13 ^ v17 ^ [(NSString *)self->_nameSuffix hash];
  NSUInteger v19 = [(NSString *)self->_nickName hash];
  unint64_t v20 = v19 ^ [(_INPBDateTimeRangeValue *)self->_nonGregorianBirthday hash];
  NSUInteger v21 = v20 ^ [(NSString *)self->_organizationName hash];
  uint64_t v22 = v21 ^ [(NSArray *)self->_phoneNumbers hash];
  NSUInteger v23 = v22 ^ [(NSString *)self->_phoneticFirstName hash];
  NSUInteger v24 = v18 ^ v23 ^ [(NSString *)self->_phoneticLastName hash];
  NSUInteger v25 = [(NSString *)self->_phoneticMiddleName hash];
  NSUInteger v26 = v25 ^ [(NSString *)self->_phoneticNamePrefix hash];
  NSUInteger v27 = v26 ^ [(NSString *)self->_phoneticNameSuffix hash];
  NSUInteger v28 = v27 ^ [(NSString *)self->_phoneticNickName hash];
  uint64_t v29 = v28 ^ [(NSArray *)self->_postalAddresses hash];
  return v24 ^ v29 ^ [(NSArray *)self->_urlAddresses hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_141;
  }
  uint64_t v5 = [(_INPBContactCard *)self birthday];
  NSUInteger v6 = [v4 birthday];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v7 = [(_INPBContactCard *)self birthday];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    NSUInteger v9 = [(_INPBContactCard *)self birthday];
    unint64_t v10 = [v4 birthday];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self contactIdentifier];
  NSUInteger v6 = [v4 contactIdentifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v12 = [(_INPBContactCard *)self contactIdentifier];
  if (v12)
  {
    NSUInteger v13 = (void *)v12;
    NSUInteger v14 = [(_INPBContactCard *)self contactIdentifier];
    NSUInteger v15 = [v4 contactIdentifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self contactRelations];
  NSUInteger v6 = [v4 contactRelations];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v17 = [(_INPBContactCard *)self contactRelations];
  if (v17)
  {
    NSUInteger v18 = (void *)v17;
    NSUInteger v19 = [(_INPBContactCard *)self contactRelations];
    unint64_t v20 = [v4 contactRelations];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self dates];
  NSUInteger v6 = [v4 dates];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v22 = [(_INPBContactCard *)self dates];
  if (v22)
  {
    NSUInteger v23 = (void *)v22;
    NSUInteger v24 = [(_INPBContactCard *)self dates];
    NSUInteger v25 = [v4 dates];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self departmentName];
  NSUInteger v6 = [v4 departmentName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v27 = [(_INPBContactCard *)self departmentName];
  if (v27)
  {
    NSUInteger v28 = (void *)v27;
    uint64_t v29 = [(_INPBContactCard *)self departmentName];
    v30 = [v4 departmentName];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self emailAddresses];
  NSUInteger v6 = [v4 emailAddresses];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v32 = [(_INPBContactCard *)self emailAddresses];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(_INPBContactCard *)self emailAddresses];
    v35 = [v4 emailAddresses];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self firstName];
  NSUInteger v6 = [v4 firstName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v37 = [(_INPBContactCard *)self firstName];
  if (v37)
  {
    v38 = (void *)v37;
    uint64_t v39 = [(_INPBContactCard *)self firstName];
    uint64_t v40 = [v4 firstName];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self fullName];
  NSUInteger v6 = [v4 fullName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v42 = [(_INPBContactCard *)self fullName];
  if (v42)
  {
    v43 = (void *)v42;
    v44 = [(_INPBContactCard *)self fullName];
    v45 = [v4 fullName];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self image];
  NSUInteger v6 = [v4 image];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v47 = [(_INPBContactCard *)self image];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(_INPBContactCard *)self image];
    v50 = [v4 image];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self instantMessageAddresses];
  NSUInteger v6 = [v4 instantMessageAddresses];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v52 = [(_INPBContactCard *)self instantMessageAddresses];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [(_INPBContactCard *)self instantMessageAddresses];
    v55 = [v4 instantMessageAddresses];
    int v56 = [v54 isEqual:v55];

    if (!v56) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  int v57 = [(_INPBContactCard *)self hasIsMe];
  if (v57 != [v4 hasIsMe]) {
    goto LABEL_141;
  }
  if ([(_INPBContactCard *)self hasIsMe])
  {
    if ([v4 hasIsMe])
    {
      int isMe = self->_isMe;
      if (isMe != [v4 isMe]) {
        goto LABEL_141;
      }
    }
  }
  uint64_t v5 = [(_INPBContactCard *)self jobTitle];
  NSUInteger v6 = [v4 jobTitle];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v59 = [(_INPBContactCard *)self jobTitle];
  if (v59)
  {
    v60 = (void *)v59;
    v61 = [(_INPBContactCard *)self jobTitle];
    v62 = [v4 jobTitle];
    int v63 = [v61 isEqual:v62];

    if (!v63) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self lastName];
  NSUInteger v6 = [v4 lastName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v64 = [(_INPBContactCard *)self lastName];
  if (v64)
  {
    uint64_t v65 = (void *)v64;
    uint64_t v66 = [(_INPBContactCard *)self lastName];
    v67 = [v4 lastName];
    int v68 = [v66 isEqual:v67];

    if (!v68) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self middleName];
  NSUInteger v6 = [v4 middleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v69 = [(_INPBContactCard *)self middleName];
  if (v69)
  {
    v70 = (void *)v69;
    v71 = [(_INPBContactCard *)self middleName];
    v72 = [v4 middleName];
    int v73 = [v71 isEqual:v72];

    if (!v73) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self namePrefix];
  NSUInteger v6 = [v4 namePrefix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v74 = [(_INPBContactCard *)self namePrefix];
  if (v74)
  {
    v75 = (void *)v74;
    v76 = [(_INPBContactCard *)self namePrefix];
    v77 = [v4 namePrefix];
    int v78 = [v76 isEqual:v77];

    if (!v78) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self nameSuffix];
  NSUInteger v6 = [v4 nameSuffix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v79 = [(_INPBContactCard *)self nameSuffix];
  if (v79)
  {
    v80 = (void *)v79;
    v81 = [(_INPBContactCard *)self nameSuffix];
    uint64_t v82 = [v4 nameSuffix];
    int v83 = [v81 isEqual:v82];

    if (!v83) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self nickName];
  NSUInteger v6 = [v4 nickName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v84 = [(_INPBContactCard *)self nickName];
  if (v84)
  {
    uint64_t v85 = (void *)v84;
    v86 = [(_INPBContactCard *)self nickName];
    v87 = [v4 nickName];
    int v88 = [v86 isEqual:v87];

    if (!v88) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self nonGregorianBirthday];
  NSUInteger v6 = [v4 nonGregorianBirthday];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v89 = [(_INPBContactCard *)self nonGregorianBirthday];
  if (v89)
  {
    uint64_t v90 = (void *)v89;
    uint64_t v91 = [(_INPBContactCard *)self nonGregorianBirthday];
    uint64_t v92 = [v4 nonGregorianBirthday];
    int v93 = [v91 isEqual:v92];

    if (!v93) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self organizationName];
  NSUInteger v6 = [v4 organizationName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v94 = [(_INPBContactCard *)self organizationName];
  if (v94)
  {
    v95 = (void *)v94;
    long long v96 = [(_INPBContactCard *)self organizationName];
    long long v97 = [v4 organizationName];
    int v98 = [v96 isEqual:v97];

    if (!v98) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneNumbers];
  NSUInteger v6 = [v4 phoneNumbers];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v99 = [(_INPBContactCard *)self phoneNumbers];
  if (v99)
  {
    long long v100 = (void *)v99;
    long long v101 = [(_INPBContactCard *)self phoneNumbers];
    long long v102 = [v4 phoneNumbers];
    int v103 = [v101 isEqual:v102];

    if (!v103) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneticFirstName];
  NSUInteger v6 = [v4 phoneticFirstName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v104 = [(_INPBContactCard *)self phoneticFirstName];
  if (v104)
  {
    long long v105 = (void *)v104;
    long long v106 = [(_INPBContactCard *)self phoneticFirstName];
    long long v107 = [v4 phoneticFirstName];
    int v108 = [v106 isEqual:v107];

    if (!v108) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneticLastName];
  NSUInteger v6 = [v4 phoneticLastName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v109 = [(_INPBContactCard *)self phoneticLastName];
  if (v109)
  {
    long long v110 = (void *)v109;
    long long v111 = [(_INPBContactCard *)self phoneticLastName];
    long long v112 = [v4 phoneticLastName];
    int v113 = [v111 isEqual:v112];

    if (!v113) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneticMiddleName];
  NSUInteger v6 = [v4 phoneticMiddleName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v114 = [(_INPBContactCard *)self phoneticMiddleName];
  if (v114)
  {
    long long v115 = (void *)v114;
    long long v116 = [(_INPBContactCard *)self phoneticMiddleName];
    long long v117 = [v4 phoneticMiddleName];
    int v118 = [v116 isEqual:v117];

    if (!v118) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneticNamePrefix];
  NSUInteger v6 = [v4 phoneticNamePrefix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v119 = [(_INPBContactCard *)self phoneticNamePrefix];
  if (v119)
  {
    long long v120 = (void *)v119;
    long long v121 = [(_INPBContactCard *)self phoneticNamePrefix];
    long long v122 = [v4 phoneticNamePrefix];
    int v123 = [v121 isEqual:v122];

    if (!v123) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneticNameSuffix];
  NSUInteger v6 = [v4 phoneticNameSuffix];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v124 = [(_INPBContactCard *)self phoneticNameSuffix];
  if (v124)
  {
    v125 = (void *)v124;
    v126 = [(_INPBContactCard *)self phoneticNameSuffix];
    v127 = [v4 phoneticNameSuffix];
    int v128 = [v126 isEqual:v127];

    if (!v128) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self phoneticNickName];
  NSUInteger v6 = [v4 phoneticNickName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v129 = [(_INPBContactCard *)self phoneticNickName];
  if (v129)
  {
    v130 = (void *)v129;
    uint64_t v131 = [(_INPBContactCard *)self phoneticNickName];
    v132 = [v4 phoneticNickName];
    int v133 = [v131 isEqual:v132];

    if (!v133) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self postalAddresses];
  NSUInteger v6 = [v4 postalAddresses];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_140;
  }
  uint64_t v134 = [(_INPBContactCard *)self postalAddresses];
  if (v134)
  {
    v135 = (void *)v134;
    v136 = [(_INPBContactCard *)self postalAddresses];
    v137 = [v4 postalAddresses];
    int v138 = [v136 isEqual:v137];

    if (!v138) {
      goto LABEL_141;
    }
  }
  else
  {
  }
  uint64_t v5 = [(_INPBContactCard *)self urlAddresses];
  NSUInteger v6 = [v4 urlAddresses];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v139 = [(_INPBContactCard *)self urlAddresses];
    if (!v139)
    {

LABEL_144:
      BOOL v144 = 1;
      goto LABEL_142;
    }
    v140 = (void *)v139;
    v141 = [(_INPBContactCard *)self urlAddresses];
    v142 = [v4 urlAddresses];
    char v143 = [v141 isEqual:v142];

    if (v143) {
      goto LABEL_144;
    }
  }
  else
  {
LABEL_140:
  }
LABEL_141:
  BOOL v144 = 0;
LABEL_142:

  return v144;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [+[_INPBContactCard allocWithZone:](_INPBContactCard, "allocWithZone:") init];
  id v6 = [(_INPBDateTimeRangeValue *)self->_birthday copyWithZone:a3];
  [(_INPBContactCard *)v5 setBirthday:v6];

  uint64_t v7 = (void *)[(NSString *)self->_contactIdentifier copyWithZone:a3];
  [(_INPBContactCard *)v5 setContactIdentifier:v7];

  NSUInteger v8 = (void *)[(NSArray *)self->_contactRelations copyWithZone:a3];
  [(_INPBContactCard *)v5 setContactRelations:v8];

  NSUInteger v9 = (void *)[(NSArray *)self->_dates copyWithZone:a3];
  [(_INPBContactCard *)v5 setDates:v9];

  unint64_t v10 = (void *)[(NSString *)self->_departmentName copyWithZone:a3];
  [(_INPBContactCard *)v5 setDepartmentName:v10];

  int v11 = (void *)[(NSArray *)self->_emailAddresses copyWithZone:a3];
  [(_INPBContactCard *)v5 setEmailAddresses:v11];

  uint64_t v12 = (void *)[(NSString *)self->_firstName copyWithZone:a3];
  [(_INPBContactCard *)v5 setFirstName:v12];

  NSUInteger v13 = (void *)[(NSString *)self->_fullName copyWithZone:a3];
  [(_INPBContactCard *)v5 setFullName:v13];

  id v14 = [(_INPBImageValue *)self->_image copyWithZone:a3];
  [(_INPBContactCard *)v5 setImage:v14];

  NSUInteger v15 = (void *)[(NSArray *)self->_instantMessageAddresses copyWithZone:a3];
  [(_INPBContactCard *)v5 setInstantMessageAddresses:v15];

  if ([(_INPBContactCard *)self hasIsMe]) {
    [(_INPBContactCard *)v5 setIsMe:[(_INPBContactCard *)self isMe]];
  }
  int v16 = (void *)[(NSString *)self->_jobTitle copyWithZone:a3];
  [(_INPBContactCard *)v5 setJobTitle:v16];

  uint64_t v17 = (void *)[(NSString *)self->_lastName copyWithZone:a3];
  [(_INPBContactCard *)v5 setLastName:v17];

  NSUInteger v18 = (void *)[(NSString *)self->_middleName copyWithZone:a3];
  [(_INPBContactCard *)v5 setMiddleName:v18];

  NSUInteger v19 = (void *)[(NSString *)self->_namePrefix copyWithZone:a3];
  [(_INPBContactCard *)v5 setNamePrefix:v19];

  unint64_t v20 = (void *)[(NSString *)self->_nameSuffix copyWithZone:a3];
  [(_INPBContactCard *)v5 setNameSuffix:v20];

  int v21 = (void *)[(NSString *)self->_nickName copyWithZone:a3];
  [(_INPBContactCard *)v5 setNickName:v21];

  id v22 = [(_INPBDateTimeRangeValue *)self->_nonGregorianBirthday copyWithZone:a3];
  [(_INPBContactCard *)v5 setNonGregorianBirthday:v22];

  NSUInteger v23 = (void *)[(NSString *)self->_organizationName copyWithZone:a3];
  [(_INPBContactCard *)v5 setOrganizationName:v23];

  NSUInteger v24 = (void *)[(NSArray *)self->_phoneNumbers copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneNumbers:v24];

  NSUInteger v25 = (void *)[(NSString *)self->_phoneticFirstName copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneticFirstName:v25];

  int v26 = (void *)[(NSString *)self->_phoneticLastName copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneticLastName:v26];

  uint64_t v27 = (void *)[(NSString *)self->_phoneticMiddleName copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneticMiddleName:v27];

  NSUInteger v28 = (void *)[(NSString *)self->_phoneticNamePrefix copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneticNamePrefix:v28];

  uint64_t v29 = (void *)[(NSString *)self->_phoneticNameSuffix copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneticNameSuffix:v29];

  v30 = (void *)[(NSString *)self->_phoneticNickName copyWithZone:a3];
  [(_INPBContactCard *)v5 setPhoneticNickName:v30];

  int v31 = (void *)[(NSArray *)self->_postalAddresses copyWithZone:a3];
  [(_INPBContactCard *)v5 setPostalAddresses:v31];

  uint64_t v32 = (void *)[(NSArray *)self->_urlAddresses copyWithZone:a3];
  [(_INPBContactCard *)v5 setUrlAddresses:v32];

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v6 = [(_INPBContactCard *)self data];
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_encodeBytesNoCopy:forKey:", v6, v5);
}

- (_INPBContactCard)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSStringFromSelector(sel_bytes);
  objc_msgSend(v4, "if_decodeBytesNoCopyForKey:", v5);
  id v6 = (_INPBContactCard *)objc_claimAutoreleasedReturnValue();

  if (v6
    || (uint64_t v7 = objc_opt_class(),
        NSStringFromSelector(sel_data),
        NSUInteger v8 = objc_claimAutoreleasedReturnValue(),
        [v4 decodeObjectOfClass:v7 forKey:v8],
        id v6 = (_INPBContactCard *)objc_claimAutoreleasedReturnValue(),
        v8,
        v6))
  {
    self = [(_INPBContactCard *)self initWithData:v6];

    id v6 = self;
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(_INPBContactCard *)self birthday];

  if (v5)
  {
    id v6 = [(_INPBContactCard *)self birthday];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(_INPBContactCard *)self contactIdentifier];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  NSUInteger v8 = self->_contactRelations;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v87 objects:v97 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v88;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v88 != v11) {
          objc_enumerationMutation(v8);
        }
        PBDataWriterWriteSubmessage();
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v87 objects:v97 count:16];
    }
    while (v10);
  }

  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  NSUInteger v13 = self->_dates;
  uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v83 objects:v96 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v84;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v84 != v16) {
          objc_enumerationMutation(v13);
        }
        PBDataWriterWriteSubmessage();
        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v83 objects:v96 count:16];
    }
    while (v15);
  }

  NSUInteger v18 = [(_INPBContactCard *)self departmentName];

  if (v18) {
    PBDataWriterWriteStringField();
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  NSUInteger v19 = self->_emailAddresses;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v80;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v80 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v79 objects:v95 count:16];
    }
    while (v21);
  }

  NSUInteger v24 = [(_INPBContactCard *)self firstName];

  if (v24) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v25 = [(_INPBContactCard *)self fullName];

  if (v25) {
    PBDataWriterWriteStringField();
  }
  int v26 = [(_INPBContactCard *)self image];

  if (v26)
  {
    uint64_t v27 = [(_INPBContactCard *)self image];
    PBDataWriterWriteSubmessage();
  }
  long long v77 = 0u;
  long long v78 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  NSUInteger v28 = self->_instantMessageAddresses;
  uint64_t v29 = [(NSArray *)v28 countByEnumeratingWithState:&v75 objects:v94 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v76;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v76 != v31) {
          objc_enumerationMutation(v28);
        }
        PBDataWriterWriteSubmessage();
        ++v32;
      }
      while (v30 != v32);
      uint64_t v30 = [(NSArray *)v28 countByEnumeratingWithState:&v75 objects:v94 count:16];
    }
    while (v30);
  }

  if ([(_INPBContactCard *)self hasIsMe]) {
    PBDataWriterWriteBOOLField();
  }
  v33 = [(_INPBContactCard *)self jobTitle];

  if (v33) {
    PBDataWriterWriteStringField();
  }
  v34 = [(_INPBContactCard *)self lastName];

  if (v34) {
    PBDataWriterWriteStringField();
  }
  v35 = [(_INPBContactCard *)self middleName];

  if (v35) {
    PBDataWriterWriteStringField();
  }
  int v36 = [(_INPBContactCard *)self namePrefix];

  if (v36) {
    PBDataWriterWriteStringField();
  }
  uint64_t v37 = [(_INPBContactCard *)self nameSuffix];

  if (v37) {
    PBDataWriterWriteStringField();
  }
  v38 = [(_INPBContactCard *)self nickName];

  if (v38) {
    PBDataWriterWriteStringField();
  }
  uint64_t v39 = [(_INPBContactCard *)self nonGregorianBirthday];

  if (v39)
  {
    uint64_t v40 = [(_INPBContactCard *)self nonGregorianBirthday];
    PBDataWriterWriteSubmessage();
  }
  int v41 = [(_INPBContactCard *)self organizationName];

  if (v41) {
    PBDataWriterWriteStringField();
  }
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  uint64_t v42 = self->_phoneNumbers;
  uint64_t v43 = [(NSArray *)v42 countByEnumeratingWithState:&v71 objects:v93 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v72;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v72 != v45) {
          objc_enumerationMutation(v42);
        }
        PBDataWriterWriteSubmessage();
        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSArray *)v42 countByEnumeratingWithState:&v71 objects:v93 count:16];
    }
    while (v44);
  }

  uint64_t v47 = [(_INPBContactCard *)self phoneticFirstName];

  if (v47) {
    PBDataWriterWriteStringField();
  }
  v48 = [(_INPBContactCard *)self phoneticLastName];

  if (v48) {
    PBDataWriterWriteStringField();
  }
  v49 = [(_INPBContactCard *)self phoneticMiddleName];

  if (v49) {
    PBDataWriterWriteStringField();
  }
  v50 = [(_INPBContactCard *)self phoneticNamePrefix];

  if (v50) {
    PBDataWriterWriteStringField();
  }
  int v51 = [(_INPBContactCard *)self phoneticNameSuffix];

  if (v51) {
    PBDataWriterWriteStringField();
  }
  uint64_t v52 = [(_INPBContactCard *)self phoneticNickName];

  if (v52) {
    PBDataWriterWriteStringField();
  }
  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  v53 = self->_postalAddresses;
  uint64_t v54 = [(NSArray *)v53 countByEnumeratingWithState:&v67 objects:v92 count:16];
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v68;
    do
    {
      uint64_t v57 = 0;
      do
      {
        if (*(void *)v68 != v56) {
          objc_enumerationMutation(v53);
        }
        PBDataWriterWriteSubmessage();
        ++v57;
      }
      while (v55 != v57);
      uint64_t v55 = [(NSArray *)v53 countByEnumeratingWithState:&v67 objects:v92 count:16];
    }
    while (v55);
  }

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  v58 = self->_urlAddresses;
  uint64_t v59 = [(NSArray *)v58 countByEnumeratingWithState:&v63 objects:v91 count:16];
  if (v59)
  {
    uint64_t v60 = v59;
    uint64_t v61 = *(void *)v64;
    do
    {
      uint64_t v62 = 0;
      do
      {
        if (*(void *)v64 != v61) {
          objc_enumerationMutation(v58);
        }
        PBDataWriterWriteSubmessage();
        ++v62;
      }
      while (v60 != v62);
      uint64_t v60 = [(NSArray *)v58 countByEnumeratingWithState:&v63 objects:v91 count:16];
    }
    while (v60);
  }
}

- (BOOL)readFrom:(id)a3
{
  return _INPBContactCardReadFrom(self, (uint64_t)a3);
}

- (id)urlAddressesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_urlAddresses objectAtIndexedSubscript:a3];
}

- (unint64_t)urlAddressesCount
{
  return [(NSArray *)self->_urlAddresses count];
}

- (void)addUrlAddresses:(id)a3
{
  id v4 = a3;
  urlAddresses = self->_urlAddresses;
  id v8 = v4;
  if (!urlAddresses)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_urlAddresses;
    self->_urlAddresses = v6;

    id v4 = v8;
    urlAddresses = self->_urlAddresses;
  }
  [(NSArray *)urlAddresses addObject:v4];
}

- (void)clearUrlAddresses
{
}

- (void)setUrlAddresses:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  urlAddresses = self->_urlAddresses;
  self->_urlAddresses = v4;

  MEMORY[0x1F41817F8](v4, urlAddresses);
}

- (id)postalAddressesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_postalAddresses objectAtIndexedSubscript:a3];
}

- (unint64_t)postalAddressesCount
{
  return [(NSArray *)self->_postalAddresses count];
}

- (void)addPostalAddresses:(id)a3
{
  id v4 = a3;
  postalAddresses = self->_postalAddresses;
  id v8 = v4;
  if (!postalAddresses)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_postalAddresses;
    self->_postalAddresses = v6;

    id v4 = v8;
    postalAddresses = self->_postalAddresses;
  }
  [(NSArray *)postalAddresses addObject:v4];
}

- (void)clearPostalAddresses
{
}

- (void)setPostalAddresses:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  postalAddresses = self->_postalAddresses;
  self->_postalAddresses = v4;

  MEMORY[0x1F41817F8](v4, postalAddresses);
}

- (BOOL)hasPhoneticNickName
{
  return self->_phoneticNickName != 0;
}

- (void)setPhoneticNickName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phoneticNickName = self->_phoneticNickName;
  self->_phoneticNickName = v4;

  MEMORY[0x1F41817F8](v4, phoneticNickName);
}

- (BOOL)hasPhoneticNameSuffix
{
  return self->_phoneticNameSuffix != 0;
}

- (void)setPhoneticNameSuffix:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phoneticNameSuffix = self->_phoneticNameSuffix;
  self->_phoneticNameSuffix = v4;

  MEMORY[0x1F41817F8](v4, phoneticNameSuffix);
}

- (BOOL)hasPhoneticNamePrefix
{
  return self->_phoneticNamePrefix != 0;
}

- (void)setPhoneticNamePrefix:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phoneticNamePrefix = self->_phoneticNamePrefix;
  self->_phoneticNamePrefix = v4;

  MEMORY[0x1F41817F8](v4, phoneticNamePrefix);
}

- (BOOL)hasPhoneticMiddleName
{
  return self->_phoneticMiddleName != 0;
}

- (void)setPhoneticMiddleName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phoneticMiddleName = self->_phoneticMiddleName;
  self->_phoneticMiddleName = v4;

  MEMORY[0x1F41817F8](v4, phoneticMiddleName);
}

- (BOOL)hasPhoneticLastName
{
  return self->_phoneticLastName != 0;
}

- (void)setPhoneticLastName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phoneticLastName = self->_phoneticLastName;
  self->_phoneticLastName = v4;

  MEMORY[0x1F41817F8](v4, phoneticLastName);
}

- (BOOL)hasPhoneticFirstName
{
  return self->_phoneticFirstName != 0;
}

- (void)setPhoneticFirstName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  phoneticFirstName = self->_phoneticFirstName;
  self->_phoneticFirstName = v4;

  MEMORY[0x1F41817F8](v4, phoneticFirstName);
}

- (id)phoneNumbersAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_phoneNumbers objectAtIndexedSubscript:a3];
}

- (unint64_t)phoneNumbersCount
{
  return [(NSArray *)self->_phoneNumbers count];
}

- (void)addPhoneNumbers:(id)a3
{
  id v4 = a3;
  phoneNumbers = self->_phoneNumbers;
  id v8 = v4;
  if (!phoneNumbers)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_phoneNumbers;
    self->_phoneNumbers = v6;

    id v4 = v8;
    phoneNumbers = self->_phoneNumbers;
  }
  [(NSArray *)phoneNumbers addObject:v4];
}

- (void)clearPhoneNumbers
{
}

- (void)setPhoneNumbers:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  phoneNumbers = self->_phoneNumbers;
  self->_phoneNumbers = v4;

  MEMORY[0x1F41817F8](v4, phoneNumbers);
}

- (BOOL)hasOrganizationName
{
  return self->_organizationName != 0;
}

- (void)setOrganizationName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  organizationName = self->_organizationName;
  self->_organizationName = v4;

  MEMORY[0x1F41817F8](v4, organizationName);
}

- (BOOL)hasNonGregorianBirthday
{
  return self->_nonGregorianBirthday != 0;
}

- (void)setNonGregorianBirthday:(id)a3
{
}

- (BOOL)hasNickName
{
  return self->_nickName != 0;
}

- (void)setNickName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  nickName = self->_nickName;
  self->_nickName = v4;

  MEMORY[0x1F41817F8](v4, nickName);
}

- (BOOL)hasNameSuffix
{
  return self->_nameSuffix != 0;
}

- (void)setNameSuffix:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  nameSuffix = self->_nameSuffix;
  self->_nameSuffix = v4;

  MEMORY[0x1F41817F8](v4, nameSuffix);
}

- (BOOL)hasNamePrefix
{
  return self->_namePrefix != 0;
}

- (void)setNamePrefix:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  namePrefix = self->_namePrefix;
  self->_namePrefix = v4;

  MEMORY[0x1F41817F8](v4, namePrefix);
}

- (BOOL)hasMiddleName
{
  return self->_middleName != 0;
}

- (void)setMiddleName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  middleName = self->_middleName;
  self->_middleName = v4;

  MEMORY[0x1F41817F8](v4, middleName);
}

- (BOOL)hasLastName
{
  return self->_lastName != 0;
}

- (void)setLastName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  lastName = self->_lastName;
  self->_lastName = v4;

  MEMORY[0x1F41817F8](v4, lastName);
}

- (BOOL)hasJobTitle
{
  return self->_jobTitle != 0;
}

- (void)setJobTitle:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  jobTitle = self->_jobTitle;
  self->_jobTitle = v4;

  MEMORY[0x1F41817F8](v4, jobTitle);
}

- (void)setHasIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsMe
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsMe:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isMe = a3;
}

- (id)instantMessageAddressesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_instantMessageAddresses objectAtIndexedSubscript:a3];
}

- (unint64_t)instantMessageAddressesCount
{
  return [(NSArray *)self->_instantMessageAddresses count];
}

- (void)addInstantMessageAddresses:(id)a3
{
  id v4 = a3;
  instantMessageAddresses = self->_instantMessageAddresses;
  id v8 = v4;
  if (!instantMessageAddresses)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_instantMessageAddresses;
    self->_instantMessageAddresses = v6;

    id v4 = v8;
    instantMessageAddresses = self->_instantMessageAddresses;
  }
  [(NSArray *)instantMessageAddresses addObject:v4];
}

- (void)clearInstantMessageAddresses
{
}

- (void)setInstantMessageAddresses:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  instantMessageAddresses = self->_instantMessageAddresses;
  self->_instantMessageAddresses = v4;

  MEMORY[0x1F41817F8](v4, instantMessageAddresses);
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setImage:(id)a3
{
}

- (BOOL)hasFullName
{
  return self->_fullName != 0;
}

- (void)setFullName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  fullName = self->_fullName;
  self->_fullName = v4;

  MEMORY[0x1F41817F8](v4, fullName);
}

- (BOOL)hasFirstName
{
  return self->_firstName != 0;
}

- (void)setFirstName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  firstName = self->_firstName;
  self->_firstName = v4;

  MEMORY[0x1F41817F8](v4, firstName);
}

- (id)emailAddressesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_emailAddresses objectAtIndexedSubscript:a3];
}

- (unint64_t)emailAddressesCount
{
  return [(NSArray *)self->_emailAddresses count];
}

- (void)addEmailAddresses:(id)a3
{
  id v4 = a3;
  emailAddresses = self->_emailAddresses;
  id v8 = v4;
  if (!emailAddresses)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_emailAddresses;
    self->_emailAddresses = v6;

    id v4 = v8;
    emailAddresses = self->_emailAddresses;
  }
  [(NSArray *)emailAddresses addObject:v4];
}

- (void)clearEmailAddresses
{
}

- (void)setEmailAddresses:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  emailAddresses = self->_emailAddresses;
  self->_emailAddresses = v4;

  MEMORY[0x1F41817F8](v4, emailAddresses);
}

- (BOOL)hasDepartmentName
{
  return self->_departmentName != 0;
}

- (void)setDepartmentName:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  departmentName = self->_departmentName;
  self->_departmentName = v4;

  MEMORY[0x1F41817F8](v4, departmentName);
}

- (id)datesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dates objectAtIndexedSubscript:a3];
}

- (unint64_t)datesCount
{
  return [(NSArray *)self->_dates count];
}

- (void)addDates:(id)a3
{
  id v4 = a3;
  dates = self->_dates;
  id v8 = v4;
  if (!dates)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dates;
    self->_dates = v6;

    id v4 = v8;
    dates = self->_dates;
  }
  [(NSArray *)dates addObject:v4];
}

- (void)clearDates
{
}

- (void)setDates:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  dates = self->_dates;
  self->_dates = v4;

  MEMORY[0x1F41817F8](v4, dates);
}

- (id)contactRelationsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_contactRelations objectAtIndexedSubscript:a3];
}

- (unint64_t)contactRelationsCount
{
  return [(NSArray *)self->_contactRelations count];
}

- (void)addContactRelations:(id)a3
{
  id v4 = a3;
  contactRelations = self->_contactRelations;
  id v8 = v4;
  if (!contactRelations)
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_contactRelations;
    self->_contactRelations = v6;

    id v4 = v8;
    contactRelations = self->_contactRelations;
  }
  [(NSArray *)contactRelations addObject:v4];
}

- (void)clearContactRelations
{
}

- (void)setContactRelations:(id)a3
{
  id v4 = (NSArray *)[a3 mutableCopy];
  contactRelations = self->_contactRelations;
  self->_contactRelations = v4;

  MEMORY[0x1F41817F8](v4, contactRelations);
}

- (BOOL)hasContactIdentifier
{
  return self->_contactIdentifier != 0;
}

- (void)setContactIdentifier:(id)a3
{
  id v4 = (NSString *)[a3 copy];
  contactIdentifier = self->_contactIdentifier;
  self->_contactIdentifier = v4;

  MEMORY[0x1F41817F8](v4, contactIdentifier);
}

- (BOOL)hasBirthday
{
  return self->_birthday != 0;
}

- (void)setBirthday:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (Class)urlAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)postalAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)phoneNumbersType
{
  return (Class)objc_opt_class();
}

+ (Class)instantMessageAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)emailAddressesType
{
  return (Class)objc_opt_class();
}

+ (Class)datesType
{
  return (Class)objc_opt_class();
}

+ (Class)contactRelationsType
{
  return (Class)objc_opt_class();
}

@end