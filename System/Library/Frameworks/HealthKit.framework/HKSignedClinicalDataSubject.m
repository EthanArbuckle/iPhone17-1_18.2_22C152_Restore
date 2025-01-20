@interface HKSignedClinicalDataSubject
+ (BOOL)supportsSecureCoding;
+ (HKSignedClinicalDataSubject)subjectWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7;
+ (HKSignedClinicalDataSubject)subjectWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 identifiers:(id)a8 addresses:(id)a9 maritalStatus:(id)a10 race:(id)a11 ethnicity:(id)a12 birthSex:(id)a13;
- (BOOL)isEqual:(id)a3;
- (HKMedicalDate)birthDate;
- (HKSignedClinicalDataSubject)initWithCoder:(id)a3;
- (HKSignedClinicalDataSubject)initWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 identifiers:(id)a8 addresses:(id)a9 maritalStatus:(id)a10 race:(id)a11 ethnicity:(id)a12 birthSex:(id)a13;
- (NSArray)addresses;
- (NSArray)emailAddresses;
- (NSArray)identifiers;
- (NSArray)phoneNumbers;
- (NSString)birthSex;
- (NSString)ethnicity;
- (NSString)fullName;
- (NSString)gender;
- (NSString)maritalStatus;
- (NSString)race;
- (id)debugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKSignedClinicalDataSubject

- (HKSignedClinicalDataSubject)initWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 identifiers:(id)a8 addresses:(id)a9 maritalStatus:(id)a10 race:(id)a11 ethnicity:(id)a12 birthSex:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v53 = a5;
  id v52 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v26 = a13;
  v54.receiver = self;
  v54.super_class = (Class)HKSignedClinicalDataSubject;
  v27 = [(HKSignedClinicalDataSubject *)&v54 init];
  if (v27)
  {
    uint64_t v28 = [v18 copy];
    fullName = v27->_fullName;
    v27->_fullName = (NSString *)v28;

    uint64_t v30 = [v19 copy];
    birthDate = v27->_birthDate;
    v27->_birthDate = (HKMedicalDate *)v30;

    uint64_t v32 = [v53 copy];
    gender = v27->_gender;
    v27->_gender = (NSString *)v32;

    uint64_t v34 = [v52 copy];
    emailAddresses = v27->_emailAddresses;
    v27->_emailAddresses = (NSArray *)v34;

    uint64_t v36 = [v20 copy];
    phoneNumbers = v27->_phoneNumbers;
    v27->_phoneNumbers = (NSArray *)v36;

    uint64_t v38 = [v21 copy];
    identifiers = v27->_identifiers;
    v27->_identifiers = (NSArray *)v38;

    uint64_t v40 = [v22 copy];
    addresses = v27->_addresses;
    v27->_addresses = (NSArray *)v40;

    uint64_t v42 = [v23 copy];
    maritalStatus = v27->_maritalStatus;
    v27->_maritalStatus = (NSString *)v42;

    uint64_t v44 = [v24 copy];
    race = v27->_race;
    v27->_race = (NSString *)v44;

    uint64_t v46 = [v25 copy];
    ethnicity = v27->_ethnicity;
    v27->_ethnicity = (NSString *)v46;

    uint64_t v48 = [v26 copy];
    birthSex = v27->_birthSex;
    v27->_birthSex = (NSString *)v48;
  }
  return v27;
}

+ (HKSignedClinicalDataSubject)subjectWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  v17 = (void *)[objc_alloc((Class)a1) initWithFullName:v16 birthDate:v15 gender:v14 emailAddresses:v13 phoneNumbers:v12 identifiers:0 addresses:0 maritalStatus:0 race:0 ethnicity:0 birthSex:0];

  return (HKSignedClinicalDataSubject *)v17;
}

+ (HKSignedClinicalDataSubject)subjectWithFullName:(id)a3 birthDate:(id)a4 gender:(id)a5 emailAddresses:(id)a6 phoneNumbers:(id)a7 identifiers:(id)a8 addresses:(id)a9 maritalStatus:(id)a10 race:(id)a11 ethnicity:(id)a12 birthSex:(id)a13
{
  id v29 = a13;
  id v28 = a12;
  id v27 = a11;
  id v18 = a10;
  id v19 = a9;
  id v26 = a8;
  id v20 = a7;
  id v21 = a6;
  id v25 = a5;
  id v22 = a4;
  id v23 = a3;
  Class v32 = (Class)[objc_alloc((Class)a1) initWithFullName:v23 birthDate:v22 gender:v25 emailAddresses:v21 phoneNumbers:v20 identifiers:v26 addresses:v19 maritalStatus:v18 race:v27 ethnicity:v28 birthSex:v29];

  return (HKSignedClinicalDataSubject *)v32;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fullName hash];
  unint64_t v4 = [(HKMedicalDate *)self->_birthDate hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_gender hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSArray *)self->_emailAddresses hash];
  uint64_t v7 = [(NSArray *)self->_phoneNumbers hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_identifiers hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_addresses hash];
  NSUInteger v10 = [(NSString *)self->_maritalStatus hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_race hash];
  NSUInteger v12 = v11 ^ [(NSString *)self->_ethnicity hash];
  return v9 ^ v12 ^ [(NSString *)self->_birthSex hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (HKSignedClinicalDataSubject *)a3;
  if (self == v4)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      identifiers = self->_identifiers;
      uint64_t v7 = [(HKSignedClinicalDataSubject *)v5 identifiers];

      if (identifiers)
      {
        if (!v7)
        {
LABEL_20:
          int v15 = 0;
          goto LABEL_21;
        }
      }
      else if (v7)
      {
        goto LABEL_20;
      }
      NSUInteger v9 = [(NSArray *)self->_identifiers count];
      identifiers = [(HKSignedClinicalDataSubject *)v5 identifiers];
      uint64_t v10 = [identifiers count];

      if (v9 != v10) {
        goto LABEL_20;
      }
      if ([(NSArray *)self->_identifiers count])
      {
        for (unint64_t i = 0; [(NSArray *)self->_identifiers count] > i; ++i)
        {
          identifiers = [(NSArray *)self->_identifiers objectAtIndexedSubscript:i];
          NSUInteger v12 = [(HKSignedClinicalDataSubject *)v5 identifiers];
          id v13 = [v12 objectAtIndexedSubscript:i];

          if (identifiers == v13)
          {
          }
          else
          {
            if (!v13)
            {

              goto LABEL_20;
            }
            int v14 = [identifiers isEqualToArray:v13];

            if (!v14) {
              goto LABEL_20;
            }
          }
        }
      }
      int v15 = 1;
LABEL_21:
      fullName = self->_fullName;
      v17 = [(HKSignedClinicalDataSubject *)v5 fullName];
      if (fullName != v17)
      {
        identifiers = [(HKSignedClinicalDataSubject *)v5 fullName];
        if (!identifiers)
        {
          char v8 = 0;
LABEL_125:

          goto LABEL_126;
        }
        id v18 = self->_fullName;
        id v19 = [(HKSignedClinicalDataSubject *)v5 fullName];
        if (![(NSString *)v18 isEqualToString:v19])
        {
          char v8 = 0;
LABEL_73:

          goto LABEL_125;
        }
        v104 = v19;
      }
      birthDate = self->_birthDate;
      id v21 = [(HKSignedClinicalDataSubject *)v5 birthDate];
      BOOL v102 = birthDate != v21;
      if (birthDate != v21)
      {
        uint64_t v22 = [(HKSignedClinicalDataSubject *)v5 birthDate];
        if (!v22)
        {

          char v8 = 0;
          id v19 = v104;
          if (fullName == v17)
          {
LABEL_124:
            if (fullName != v17) {
              goto LABEL_125;
            }
            goto LABEL_126;
          }
LABEL_123:

          goto LABEL_124;
        }
        v98 = (void *)v22;
        id v23 = self->_birthDate;
        v100 = [(HKSignedClinicalDataSubject *)v5 birthDate];
        if (!-[HKMedicalDate isEqual:](v23, "isEqual:"))
        {
          char v8 = 0;
          id v19 = v104;
          goto LABEL_72;
        }
      }
      gender = self->_gender;
      v101 = [(HKSignedClinicalDataSubject *)v5 gender];
      v99 = gender;
      BOOL v96 = gender != v101;
      if (gender != v101)
      {
        uint64_t v25 = [(HKSignedClinicalDataSubject *)v5 gender];
        if (!v25)
        {

          char v8 = 0;
          if (birthDate != v21)
          {
            LOBYTE(v34) = 1;
            id v19 = v104;
            goto LABEL_120;
          }
          BOOL v34 = 0;
          id v19 = v104;
LABEL_128:
          if (!v34) {
            goto LABEL_122;
          }
LABEL_121:

          goto LABEL_122;
        }
        v93 = (void *)v25;
        id v26 = self->_gender;
        v95 = [(HKSignedClinicalDataSubject *)v5 gender];
        if (!-[NSString isEqualToString:](v26, "isEqualToString:"))
        {
          char v8 = 0;
          id v27 = v101;
          goto LABEL_71;
        }
      }
      emailAddresses = self->_emailAddresses;
      v97 = [(HKSignedClinicalDataSubject *)v5 emailAddresses];
      v94 = emailAddresses;
      BOOL v29 = emailAddresses == v97;
      BOOL v30 = emailAddresses != v97;
      if (v29)
      {
        BOOL v91 = v30;
      }
      else
      {
        uint64_t v31 = [(HKSignedClinicalDataSubject *)v5 emailAddresses];
        if (!v31)
        {

          char v8 = 0;
          id v27 = v101;
          if (v99 != v101)
          {
            LOBYTE(v39) = 1;
            goto LABEL_117;
          }
          BOOL v39 = 0;
LABEL_130:
          if (!v39) {
            goto LABEL_119;
          }
LABEL_118:

          goto LABEL_119;
        }
        BOOL v91 = v30;
        v88 = (void *)v31;
        Class v32 = self->_emailAddresses;
        v90 = [(HKSignedClinicalDataSubject *)v5 emailAddresses];
        if (!-[NSArray isEqualToArray:](v32, "isEqualToArray:"))
        {
          char v8 = 0;
          id v27 = v101;
          v33 = v99;
          goto LABEL_70;
        }
      }
      phoneNumbers = self->_phoneNumbers;
      uint64_t v36 = [(HKSignedClinicalDataSubject *)v5 phoneNumbers];
      v89 = phoneNumbers;
      BOOL v87 = phoneNumbers != (NSArray *)v36;
      v92 = (NSArray *)v36;
      if (phoneNumbers != (NSArray *)v36)
      {
        uint64_t v37 = [(HKSignedClinicalDataSubject *)v5 phoneNumbers];
        if (!v37)
        {

          char v8 = 0;
          id v27 = v101;
          v33 = v99;
          if (v94 != v97)
          {
            LOBYTE(v91) = 1;
            goto LABEL_114;
          }
          BOOL v91 = 0;
LABEL_132:
          if (!v91) {
            goto LABEL_116;
          }
LABEL_115:

          goto LABEL_116;
        }
        v85 = (void *)v37;
        uint64_t v38 = self->_phoneNumbers;
        v86 = [(HKSignedClinicalDataSubject *)v5 phoneNumbers];
        if (!-[NSArray isEqualToArray:](v38, "isEqualToArray:"))
        {
          char v8 = 0;
          id v27 = v101;
          v33 = v99;
          goto LABEL_69;
        }
        uint64_t v36 = (uint64_t)v92;
      }
      if (!v15)
      {
        char v8 = 0;
        id v27 = v101;
        v33 = v99;
        if (v89 != (NSArray *)v36) {
          goto LABEL_111;
        }
        goto LABEL_134;
      }
      addresses = self->_addresses;
      uint64_t v41 = [(HKSignedClinicalDataSubject *)v5 addresses];
      uint64_t v42 = (NSArray *)v41;
      v81 = addresses;
      BOOL v82 = addresses != (NSArray *)v41;
      if (addresses == (NSArray *)v41)
      {
        v84 = (NSArray *)v41;
      }
      else
      {
        uint64_t v43 = [(HKSignedClinicalDataSubject *)v5 addresses];
        if (!v43)
        {

          char v8 = 0;
          id v27 = v101;
          v33 = v99;
          if (v89 != v92)
          {
            LOBYTE(v87) = 1;
            goto LABEL_111;
          }
          BOOL v87 = 0;
LABEL_134:
          if (!v87) {
            goto LABEL_113;
          }
LABEL_112:

          goto LABEL_113;
        }
        v78 = (void *)v43;
        uint64_t v44 = self->_addresses;
        v79 = [(HKSignedClinicalDataSubject *)v5 addresses];
        v84 = v42;
        if (!-[NSArray isEqualToArray:](v44, "isEqualToArray:"))
        {
          char v8 = 0;
          id v27 = v101;
          v33 = v99;
          goto LABEL_68;
        }
      }
      maritalStatus = self->_maritalStatus;
      v80 = [(HKSignedClinicalDataSubject *)v5 maritalStatus];
      v77 = maritalStatus;
      BOOL v46 = maritalStatus != v80;
      if (maritalStatus != v80)
      {
        uint64_t v47 = [(HKSignedClinicalDataSubject *)v5 maritalStatus];
        if (!v47)
        {

          char v8 = 0;
          id v27 = v101;
          v33 = v99;
          if (v81 != v84)
          {
            LOBYTE(v53) = 1;
            goto LABEL_108;
          }
          BOOL v53 = 0;
LABEL_136:
          if (!v53) {
            goto LABEL_110;
          }
LABEL_109:

          goto LABEL_110;
        }
        v74 = (void *)v47;
        uint64_t v48 = self->_maritalStatus;
        v75 = [(HKSignedClinicalDataSubject *)v5 maritalStatus];
        if (!-[NSString isEqualToString:](v48, "isEqualToString:"))
        {
          char v8 = 0;
          id v27 = v101;
          goto LABEL_67;
        }
      }
      race = self->_race;
      v76 = [(HKSignedClinicalDataSubject *)v5 race];
      if (race != v76)
      {
        uint64_t v50 = [(HKSignedClinicalDataSubject *)v5 race];
        if (!v50)
        {

          char v8 = 0;
          id v27 = v101;
          if (v77 != v80) {
            goto LABEL_102;
          }
          goto LABEL_105;
        }
        v51 = race;
        v71 = (void *)v50;
        id v52 = self->_race;
        v70 = [(HKSignedClinicalDataSubject *)v5 race];
        if (!-[NSString isEqualToString:](v52, "isEqualToString:"))
        {
          char v8 = 0;
          id v27 = v101;
          v64 = v76;
LABEL_100:

          if (v77 != v80)
          {
            LOBYTE(v46) = 1;
LABEL_102:

            if (!v46) {
              goto LABEL_107;
            }
LABEL_106:

            goto LABEL_107;
          }
          BOOL v46 = 0;
LABEL_105:
          if (!v46) {
            goto LABEL_107;
          }
          goto LABEL_106;
        }
        race = v51;
      }
      ethnicity = self->_ethnicity;
      v72 = [(HKSignedClinicalDataSubject *)v5 ethnicity];
      v73 = race;
      v69 = ethnicity;
      if (ethnicity != v72)
      {
        uint64_t v55 = [(HKSignedClinicalDataSubject *)v5 ethnicity];
        if (!v55)
        {
          char v8 = 0;
          id v27 = v101;
          v63 = v72;
          goto LABEL_99;
        }
        v68 = (void *)v55;
        v56 = self->_ethnicity;
        v57 = [(HKSignedClinicalDataSubject *)v5 ethnicity];
        if (![(NSString *)v56 isEqualToString:v57])
        {

          char v8 = 0;
          goto LABEL_143;
        }
        v67 = v57;
      }
      birthSex = self->_birthSex;
      uint64_t v59 = [(HKSignedClinicalDataSubject *)v5 birthSex];
      char v8 = birthSex == (NSString *)v59;
      if (birthSex != (NSString *)v59)
      {
        birthSex = (NSString *)v59;
        uint64_t v60 = [(HKSignedClinicalDataSubject *)v5 birthSex];
        if (v60)
        {
          v61 = self->_birthSex;
          v103 = (void *)v60;
          v62 = [(HKSignedClinicalDataSubject *)v5 birthSex];
          char v8 = [(NSString *)v61 isEqualToString:v62];

          if (v69 == v72)
          {
          }
          else
          {
          }
LABEL_143:
          if (v73 != v76)
          {
          }
          if (v77 != v80)
          {
          }
          if (v81 != v84)
          {
          }
          if (v89 != v92)
          {
          }
          if (v94 != v97)
          {
          }
          if (v99 != v101)
          {
          }
          if (birthDate != v21)
          {
          }
          id v19 = v104;
          if (fullName == v17) {
            goto LABEL_126;
          }
          goto LABEL_73;
        }
      }

      v63 = v72;
      if (v69 == v72)
      {

        v64 = v76;
        v65 = v73;
        id v27 = v101;
        if (v73 != v76) {
          goto LABEL_100;
        }
        goto LABEL_140;
      }

      id v27 = v101;
LABEL_99:

      v64 = v76;
      v65 = v73;
      if (v73 != v76) {
        goto LABEL_100;
      }
LABEL_140:

      if (v77 != v80)
      {
LABEL_67:

        v33 = v99;
        if (v81 != v84)
        {
LABEL_68:

          if (v89 != v92)
          {
LABEL_69:

            if (v94 != v97)
            {
LABEL_70:

              if (v33 != v27)
              {
LABEL_71:

                BOOL v29 = birthDate == v21;
                id v19 = v104;
                if (!v29)
                {
LABEL_72:

                  if (fullName != v17) {
                    goto LABEL_73;
                  }
LABEL_126:

                  goto LABEL_127;
                }
LABEL_122:

                if (fullName == v17) {
                  goto LABEL_124;
                }
                goto LABEL_123;
              }
LABEL_119:

              BOOL v29 = birthDate == v21;
              id v19 = v104;
              BOOL v34 = v102;
              if (!v29)
              {
LABEL_120:

                if (!v34) {
                  goto LABEL_122;
                }
                goto LABEL_121;
              }
              goto LABEL_128;
            }
LABEL_116:

            BOOL v29 = v33 == v27;
            BOOL v39 = v96;
            if (!v29)
            {
LABEL_117:

              if (!v39) {
                goto LABEL_119;
              }
              goto LABEL_118;
            }
            goto LABEL_130;
          }
LABEL_113:

          if (v94 != v97)
          {
LABEL_114:

            if (!v91) {
              goto LABEL_116;
            }
            goto LABEL_115;
          }
          goto LABEL_132;
        }
LABEL_110:

        if (v89 != v92)
        {
LABEL_111:

          if (!v87) {
            goto LABEL_113;
          }
          goto LABEL_112;
        }
        goto LABEL_134;
      }
LABEL_107:

      v33 = v99;
      BOOL v53 = v82;
      if (v81 != v84)
      {
LABEL_108:
        BOOL v83 = v53;

        if (!v83) {
          goto LABEL_110;
        }
        goto LABEL_109;
      }
      goto LABEL_136;
    }
    char v8 = 0;
  }
LABEL_127:

  return v8;
}

- (id)debugDescription
{
  NSUInteger v3 = [(NSArray *)self->_identifiers hk_map:&__block_literal_global_95];
  unint64_t v4 = [v3 componentsJoinedByString:@"; "];

  NSUInteger v5 = NSString;
  fullName = self->_fullName;
  uint64_t v7 = [(HKMedicalDate *)self->_birthDate description];
  gender = self->_gender;
  NSUInteger v9 = [(NSArray *)self->_emailAddresses componentsJoinedByString:@", "];
  uint64_t v10 = [(NSArray *)self->_phoneNumbers componentsJoinedByString:@", "];
  NSUInteger v11 = [(NSArray *)self->_addresses componentsJoinedByString:@", "];
  NSUInteger v12 = [v5 stringWithFormat:@"Full Name: %@, Birth Date: %@, Gender: %@, Email Addresses: %@, Phone Numbers: %@, Identifiers: %@, Addresses: %@, Marital Status: %@, Race: %@, Ethnicity: %@, Birth Sex: %@", fullName, v7, gender, v9, v10, v4, v11, self->_maritalStatus, self->_race, self->_ethnicity, self->_birthSex];

  return v12;
}

uint64_t __47__HKSignedClinicalDataSubject_debugDescription__block_invoke(uint64_t a1, void *a2)
{
  return [a2 componentsJoinedByString:@": "];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKSignedClinicalDataSubject)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)HKSignedClinicalDataSubject;
  NSUInteger v5 = [(HKSignedClinicalDataSubject *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullName"];
    fullName = v5->_fullName;
    v5->_fullName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"birthDate"];
    birthDate = v5->_birthDate;
    v5->_birthDate = (HKMedicalDate *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"gender"];
    gender = v5->_gender;
    v5->_gender = (NSString *)v10;

    NSUInteger v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    int v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = [v4 decodeObjectOfClasses:v14 forKey:@"emailAddresses"];
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v15;

    uint64_t v17 = [v4 decodeObjectOfClasses:v14 forKey:@"phoneNumbers"];
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v17;

    uint64_t v19 = [v4 decodeObjectOfClasses:v14 forKey:@"identifiersNumbers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v19;

    uint64_t v21 = [v4 decodeObjectOfClasses:v14 forKey:@"addressesNumbers"];
    addresses = v5->_addresses;
    v5->_addresses = (NSArray *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"maritalStatusNumbers"];
    maritalStatus = v5->_maritalStatus;
    v5->_maritalStatus = (NSString *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"raceNumbers"];
    race = v5->_race;
    v5->_race = (NSString *)v25;

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ethnicityNumbers"];
    ethnicity = v5->_ethnicity;
    v5->_ethnicity = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"birthSexNumbers"];
    birthSex = v5->_birthSex;
    v5->_birthSex = (NSString *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  fullName = self->_fullName;
  id v5 = a3;
  [v5 encodeObject:fullName forKey:@"fullName"];
  [v5 encodeObject:self->_birthDate forKey:@"birthDate"];
  [v5 encodeObject:self->_gender forKey:@"gender"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
  [v5 encodeObject:self->_identifiers forKey:@"identifiersNumbers"];
  [v5 encodeObject:self->_addresses forKey:@"addressesNumbers"];
  [v5 encodeObject:self->_maritalStatus forKey:@"maritalStatusNumbers"];
  [v5 encodeObject:self->_race forKey:@"raceNumbers"];
  [v5 encodeObject:self->_ethnicity forKey:@"ethnicityNumbers"];
  [v5 encodeObject:self->_birthSex forKey:@"birthSexNumbers"];
}

- (NSString)fullName
{
  return self->_fullName;
}

- (HKMedicalDate)birthDate
{
  return self->_birthDate;
}

- (NSString)gender
{
  return self->_gender;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (NSArray)addresses
{
  return self->_addresses;
}

- (NSString)maritalStatus
{
  return self->_maritalStatus;
}

- (NSString)race
{
  return self->_race;
}

- (NSString)ethnicity
{
  return self->_ethnicity;
}

- (NSString)birthSex
{
  return self->_birthSex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_birthSex, 0);
  objc_storeStrong((id *)&self->_ethnicity, 0);
  objc_storeStrong((id *)&self->_race, 0);
  objc_storeStrong((id *)&self->_maritalStatus, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_gender, 0);
  objc_storeStrong((id *)&self->_birthDate, 0);

  objc_storeStrong((id *)&self->_fullName, 0);
}

@end