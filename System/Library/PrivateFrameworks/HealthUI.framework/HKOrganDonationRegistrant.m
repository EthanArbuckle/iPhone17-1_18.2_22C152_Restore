@interface HKOrganDonationRegistrant
+ (BOOL)_isNumericStringValid:(id)a3 withLength:(int64_t)a4;
+ (BOOL)supportsSecureCoding;
+ (HKOrganDonationRegistrant)organDonationRegistrantWithDemographicsInformation:(id)a3;
+ (HKOrganDonationRegistrant)organDonationRegistrantWithJSONDictionary:(id)a3;
+ (id)_importNumberFormatter;
+ (id)convertLocalizedNumericStringToLatin:(id)a3 withNumberFormatter:(id)a4;
+ (id)exportDateFormatter;
+ (id)ssnNumberFormatter;
+ (id)zipcodeNumberFormatter;
+ (void)_loadStateInformationIfNeeded;
- (BOOL)hasEdits;
- (BOOL)isFieldValid:(int64_t)a3;
- (BOOL)isRegistrantValid;
- (HKOrganDonationRegistrant)init;
- (HKOrganDonationRegistrant)initWithCoder:(id)a3;
- (HKOrganDonationRegistrantDelegate)delegate;
- (NSNumber)age;
- (NSString)address1;
- (NSString)address2;
- (NSString)city;
- (NSString)dob;
- (NSString)email;
- (NSString)firstname;
- (NSString)last4SSN;
- (NSString)lastname;
- (NSString)middlename;
- (NSString)sex;
- (NSString)state;
- (NSString)zip;
- (id)_createDateOfBirthEntryItem;
- (id)_stateChoiceDisplayNames;
- (id)_stateChoiceValues;
- (id)_todayBirthdayDateComponents;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dataEntryItemForRegistrantField:(int64_t)a3;
- (id)dataEntryItemsValidOnly:(BOOL)a3;
- (id)jsonDictionaryRepresentation;
- (unint64_t)_placeHolderTypeForField:(int64_t)a3;
- (void)_addDataEntryItemIntoArray:(id)a3 validOnly:(BOOL)a4 forField:(int64_t)a5;
- (void)dataEntryItemDidUpdateValue:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAddress1:(id)a3;
- (void)setAddress2:(id)a3;
- (void)setCity:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDob:(id)a3;
- (void)setEmail:(id)a3;
- (void)setFirstname:(id)a3;
- (void)setLast4SSN:(id)a3;
- (void)setLastname:(id)a3;
- (void)setMiddlename:(id)a3;
- (void)setSex:(id)a3;
- (void)setState:(id)a3;
- (void)setZip:(id)a3;
@end

@implementation HKOrganDonationRegistrant

+ (HKOrganDonationRegistrant)organDonationRegistrantWithJSONDictionary:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(HKOrganDonationRegistrant);
  v5 = [v3 objectForKeyedSubscript:@"firstname"];
  [(HKOrganDonationRegistrant *)v4 setFirstname:v5];

  v6 = [v3 objectForKeyedSubscript:@"middlename"];
  [(HKOrganDonationRegistrant *)v4 setMiddlename:v6];

  v7 = [v3 objectForKeyedSubscript:@"lastname"];
  [(HKOrganDonationRegistrant *)v4 setLastname:v7];

  v8 = [v3 objectForKeyedSubscript:@"dob"];
  [(HKOrganDonationRegistrant *)v4 setDob:v8];

  v9 = [v3 objectForKeyedSubscript:@"gender"];
  [(HKOrganDonationRegistrant *)v4 setSex:v9];

  v10 = [v3 objectForKeyedSubscript:@"email"];
  [(HKOrganDonationRegistrant *)v4 setEmail:v10];

  v11 = [v3 objectForKeyedSubscript:@"address1"];
  [(HKOrganDonationRegistrant *)v4 setAddress1:v11];

  v12 = [v3 objectForKeyedSubscript:@"address2"];
  [(HKOrganDonationRegistrant *)v4 setAddress2:v12];

  v13 = [v3 objectForKeyedSubscript:@"city"];
  [(HKOrganDonationRegistrant *)v4 setCity:v13];

  v14 = [v3 objectForKeyedSubscript:@"state"];
  [(HKOrganDonationRegistrant *)v4 setState:v14];

  v15 = [v3 objectForKeyedSubscript:@"zip"];
  [(HKOrganDonationRegistrant *)v4 setZip:v15];

  v16 = [v3 objectForKeyedSubscript:@"last4SSN"];

  [(HKOrganDonationRegistrant *)v4 setLast4SSN:v16];
  return v4;
}

+ (HKOrganDonationRegistrant)organDonationRegistrantWithDemographicsInformation:(id)a3
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_alloc_init(HKOrganDonationRegistrant);
  if (!v4) {
    goto LABEL_60;
  }
  id v66 = a1;
  v6 = [v4 firstName];
  [(HKOrganDonationRegistrant *)v5 setFirstname:v6];

  v7 = [v4 middleName];
  [(HKOrganDonationRegistrant *)v5 setMiddlename:v7];

  v8 = [v4 lastName];
  [(HKOrganDonationRegistrant *)v5 setLastname:v8];

  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  obuint64_t j = [v4 postalAddresses];
  uint64_t v9 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
  v10 = (uint64_t *)MEMORY[0x1E4F1B6F8];
  v67 = v5;
  v68 = v4;
  if (!v9)
  {
    v70 = 0;
    v29 = obj;
LABEL_39:

    goto LABEL_40;
  }
  uint64_t v11 = v9;
  v12 = 0;
  uint64_t v72 = *(void *)v79;
  uint64_t v69 = *MEMORY[0x1E4F1C400];
  uint64_t v13 = *MEMORY[0x1E4F1B6F8];
  v14 = obj;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v79 != v72) {
        objc_enumerationMutation(v14);
      }
      v16 = *(void **)(*((void *)&v78 + 1) + 8 * i);
      v17 = [v16 value];
      v18 = [v16 label];
      v19 = [v17 ISOCountryCode];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        v21 = [v17 ISOCountryCode];
        int v22 = [v21 isEqualToString:@"us"];
      }
      else
      {
        v21 = [v17 country];
        v23 = [MEMORY[0x1E4F1CA20] currentLocale];
        [v23 displayNameForKey:v69 value:@"us"];
        v25 = v24 = v12;

        int v22 = [v21 isEqualToString:v25];
        v12 = v24;
        v14 = obj;
      }

      int v26 = [v18 isEqualToString:v13];
      if (!v22 || (v26 & 1) != 0 || v12)
      {
        if ((v22 & v26) == 1)
        {
          uint64_t v27 = [v16 value];

          v12 = (void *)v27;
        }
      }
      else
      {
        v12 = [v16 value];
      }
    }
    uint64_t v11 = [v14 countByEnumeratingWithState:&v78 objects:v83 count:16];
  }
  while (v11);

  if (v12)
  {
    v28 = [v12 street];
    v29 = [v28 componentsSeparatedByString:@"\n"];

    id v4 = v68;
    if ([v29 count] == 1)
    {
      v30 = [v29 lastObject];
      [(HKOrganDonationRegistrant *)v67 setAddress1:v30];
      v10 = (uint64_t *)MEMORY[0x1E4F1B6F8];
    }
    else
    {
      unint64_t v31 = [v29 count];
      v10 = (uint64_t *)MEMORY[0x1E4F1B6F8];
      if (v31 < 2) {
        goto LABEL_27;
      }
      v32 = [v29 firstObject];
      [(HKOrganDonationRegistrant *)v67 setAddress1:v32];

      v30 = [v29 lastObject];
      [(HKOrganDonationRegistrant *)v67 setAddress2:v30];
    }

LABEL_27:
    v33 = [v12 city];
    [(HKOrganDonationRegistrant *)v67 setCity:v33];

    v70 = v12;
    v34 = [v12 postalCode];
    if ((unint64_t)[v34 length] < 5)
    {
      v35 = v34;
    }
    else
    {
      v35 = [v34 substringToIndex:5];

      if ([v66 _isNumericStringValid:v35 withLength:5]) {
        [(HKOrganDonationRegistrant *)v67 setZip:v35];
      }
    }
    v36 = [v70 state];
    v37 = [v36 uppercaseString];

    if ([v37 length] == 2)
    {
      [v66 _loadStateInformationIfNeeded];
      if ([(id)_sortedStateAbbreviations indexOfObject:v37] != 0x7FFFFFFFFFFFFFFFLL) {
        [(HKOrganDonationRegistrant *)v67 setState:v37];
      }
    }
    else if ([v37 length])
    {
      v38 = v29;
      [v66 _loadStateInformationIfNeeded];
      v39 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF LIKE[c] %@", v37];
      v40 = [(id)_sortedStateNames filteredArrayUsingPredicate:v39];
      v41 = [v40 firstObject];

      if (v41)
      {
        uint64_t v42 = [(id)_sortedStateNames indexOfObject:v41];
        v43 = [(id)_sortedStateAbbreviations objectAtIndexedSubscript:v42];
        [(HKOrganDonationRegistrant *)v67 setState:v43];
      }
      v29 = v38;
    }

    goto LABEL_39;
  }
  v70 = 0;
  id v4 = v68;
  v10 = (uint64_t *)MEMORY[0x1E4F1B6F8];
LABEL_40:
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  v44 = [v4 emailAddresses];
  uint64_t v45 = [v44 countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v45)
  {
    uint64_t v46 = v45;
    v73 = 0;
    uint64_t v47 = *(void *)v75;
    uint64_t v48 = *v10;
    while (2)
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v75 != v47) {
          objc_enumerationMutation(v44);
        }
        v50 = *(void **)(*((void *)&v74 + 1) + 8 * j);
        v51 = [v50 value];
        uint64_t v52 = [v51 rangeOfString:@"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$" options:1025];

        if (v52 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v53 = [v50 label];
          int v54 = [v53 isEqualToString:v48];

          if (v54)
          {
            uint64_t v55 = [v50 value];

            v73 = (void *)v55;
            goto LABEL_54;
          }
          if (!v73)
          {
            v73 = [v50 value];
          }
        }
      }
      uint64_t v46 = [v44 countByEnumeratingWithState:&v74 objects:v82 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }
  else
  {
    v73 = 0;
  }
LABEL_54:

  v5 = v67;
  [(HKOrganDonationRegistrant *)v67 setEmail:v73];
  id v4 = v68;
  v56 = [v68 dateOfBirthComponents];

  if (v56)
  {
    v57 = +[HKSimpleDataEntryDateItem gregorianGMTCalendar];
    v58 = [v68 dateOfBirthComponents];
    v59 = [v57 dateFromComponents:v58];

    v60 = [v66 exportDateFormatter];
    v61 = [v60 stringFromDate:v59];
    [(HKOrganDonationRegistrant *)v67 setDob:v61];
  }
  v62 = [v68 biologicalSexObject];

  if (v62)
  {
    v63 = [v68 biologicalSexObject];
    uint64_t v64 = [v63 biologicalSex];

    if ((unint64_t)(v64 - 1) <= 2) {
      [(HKOrganDonationRegistrant *)v67 setSex:off_1E6D55660[v64 - 1]];
    }
  }

LABEL_60:
  return v5;
}

- (HKOrganDonationRegistrant)init
{
  v6.receiver = self;
  v6.super_class = (Class)HKOrganDonationRegistrant;
  v2 = [(HKOrganDonationRegistrant *)&v6 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dataEntryItems = v2->_dataEntryItems;
    v2->_dataEntryItems = v3;

    v2->_hasEdits = 0;
  }
  return v2;
}

- (HKOrganDonationRegistrant)initWithCoder:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HKOrganDonationRegistrant;
  v5 = [(HKOrganDonationRegistrant *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"firstname"];
    firstname = v5->_firstname;
    v5->_firstname = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"middlename"];
    middlename = v5->_middlename;
    v5->_middlename = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectForKey:@"lastname"];
    lastname = v5->_lastname;
    v5->_lastname = (NSString *)v10;

    uint64_t v12 = [v4 decodeObjectForKey:@"dob"];
    dob = v5->_dob;
    v5->_dob = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectForKey:@"sex"];
    sex = v5->_sex;
    v5->_sex = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectForKey:@"email"];
    email = v5->_email;
    v5->_email = (NSString *)v16;

    uint64_t v18 = [v4 decodeObjectForKey:@"address1"];
    address1 = v5->_address1;
    v5->_address1 = (NSString *)v18;

    uint64_t v20 = [v4 decodeObjectForKey:@"address2"];
    address2 = v5->_address2;
    v5->_address2 = (NSString *)v20;

    uint64_t v22 = [v4 decodeObjectForKey:@"city"];
    city = v5->_city;
    v5->_city = (NSString *)v22;

    uint64_t v24 = [v4 decodeObjectForKey:@"state"];
    state = v5->_state;
    v5->_state = (NSString *)v24;

    uint64_t v26 = [v4 decodeObjectForKey:@"zip"];
    zip = v5->_zip;
    v5->_zip = (NSString *)v26;

    uint64_t v28 = [v4 decodeObjectForKey:@"last4SSN"];
    last4SSN = v5->_last4SSN;
    v5->_last4SSN = (NSString *)v28;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  firstname = self->_firstname;
  id v5 = a3;
  [v5 encodeObject:firstname forKey:@"firstname"];
  [v5 encodeObject:self->_middlename forKey:@"middlename"];
  [v5 encodeObject:self->_lastname forKey:@"lastname"];
  [v5 encodeObject:self->_dob forKey:@"dob"];
  [v5 encodeObject:self->_sex forKey:@"sex"];
  [v5 encodeObject:self->_email forKey:@"email"];
  [v5 encodeObject:self->_address1 forKey:@"address1"];
  [v5 encodeObject:self->_address2 forKey:@"address2"];
  [v5 encodeObject:self->_city forKey:@"city"];
  [v5 encodeObject:self->_state forKey:@"state"];
  [v5 encodeObject:self->_zip forKey:@"zip"];
  [v5 encodeObject:self->_last4SSN forKey:@"last4SSN"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[HKOrganDonationRegistrant allocWithZone:](HKOrganDonationRegistrant, "allocWithZone:") init];
  uint64_t v6 = [(NSString *)self->_firstname copyWithZone:a3];
  firstname = v5->_firstname;
  v5->_firstname = (NSString *)v6;

  uint64_t v8 = [(NSString *)self->_middlename copyWithZone:a3];
  middlename = v5->_middlename;
  v5->_middlename = (NSString *)v8;

  uint64_t v10 = [(NSString *)self->_lastname copyWithZone:a3];
  lastname = v5->_lastname;
  v5->_lastname = (NSString *)v10;

  uint64_t v12 = [(NSString *)self->_dob copyWithZone:a3];
  dob = v5->_dob;
  v5->_dob = (NSString *)v12;

  uint64_t v14 = [(NSString *)self->_sex copyWithZone:a3];
  sex = v5->_sex;
  v5->_sex = (NSString *)v14;

  uint64_t v16 = [(NSString *)self->_email copyWithZone:a3];
  email = v5->_email;
  v5->_email = (NSString *)v16;

  uint64_t v18 = [(NSString *)self->_address1 copyWithZone:a3];
  address1 = v5->_address1;
  v5->_address1 = (NSString *)v18;

  uint64_t v20 = [(NSString *)self->_address2 copyWithZone:a3];
  address2 = v5->_address2;
  v5->_address2 = (NSString *)v20;

  uint64_t v22 = [(NSString *)self->_city copyWithZone:a3];
  city = v5->_city;
  v5->_city = (NSString *)v22;

  uint64_t v24 = [(NSString *)self->_state copyWithZone:a3];
  state = v5->_state;
  v5->_state = (NSString *)v24;

  uint64_t v26 = [(NSString *)self->_zip copyWithZone:a3];
  zip = v5->_zip;
  v5->_zip = (NSString *)v26;

  uint64_t v28 = [(NSString *)self->_last4SSN copyWithZone:a3];
  last4SSN = v5->_last4SSN;
  v5->_last4SSN = (NSString *)v28;

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)jsonDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = v3;
  firstname = self->_firstname;
  if (firstname) {
    [v3 setObject:firstname forKey:@"firstname"];
  }
  middlename = self->_middlename;
  if (middlename) {
    [v4 setObject:middlename forKey:@"middlename"];
  }
  lastname = self->_lastname;
  if (lastname) {
    [v4 setObject:lastname forKey:@"lastname"];
  }
  email = self->_email;
  if (email)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
    uint64_t v10 = [(NSString *)email stringByTrimmingCharactersInSet:v9];
    [v4 setObject:v10 forKey:@"email"];
  }
  dob = self->_dob;
  if (dob) {
    [v4 setObject:dob forKey:@"dob"];
  }
  sex = self->_sex;
  if (sex) {
    [v4 setObject:sex forKey:@"gender"];
  }
  address1 = self->_address1;
  if (address1) {
    [v4 setObject:address1 forKey:@"address1"];
  }
  address2 = self->_address2;
  if (address2) {
    [v4 setObject:address2 forKey:@"address2"];
  }
  city = self->_city;
  if (city) {
    [v4 setObject:city forKey:@"city"];
  }
  state = self->_state;
  if (state) {
    [v4 setObject:state forKey:@"state"];
  }
  if (self->_zip)
  {
    v17 = objc_opt_class();
    zip = self->_zip;
    v19 = [(id)objc_opt_class() zipcodeNumberFormatter];
    uint64_t v20 = [v17 convertLocalizedNumericStringToLatin:zip withNumberFormatter:v19];

    [v4 setObject:v20 forKey:@"zip"];
  }
  if (self->_last4SSN)
  {
    v21 = objc_opt_class();
    last4SSN = self->_last4SSN;
    v23 = [(id)objc_opt_class() ssnNumberFormatter];
    uint64_t v24 = [v21 convertLocalizedNumericStringToLatin:last4SSN withNumberFormatter:v23];

    [v4 setObject:v24 forKey:@"last4SSN"];
  }
  return v4;
}

- (id)dataEntryItemsValidOnly:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F28F30]);
  int v7 = [v6 isGivenNameFirst];
  if (v7) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  if (v7) {
    uint64_t v9 = 2;
  }
  else {
    uint64_t v9 = 0;
  }
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:v8];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:1];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:v9];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:3];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:12];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:5];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:7];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:8];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:9];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:10];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:11];
  [(HKOrganDonationRegistrant *)self _addDataEntryItemIntoArray:v5 validOnly:v3 forField:4];

  return v5;
}

- (void)_addDataEntryItemIntoArray:(id)a3 validOnly:(BOOL)a4 forField:(int64_t)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  if (!v6 || [(HKOrganDonationRegistrant *)self isFieldValid:a5])
  {
    uint64_t v8 = [(HKOrganDonationRegistrant *)self dataEntryItemForRegistrantField:a5];
    [v9 addObject:v8];
  }
}

- (id)dataEntryItemForRegistrantField:(int64_t)a3
{
  v65[4] = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend(NSNumber, "numberWithInteger:");
  BOOL v6 = [(NSMutableDictionary *)self->_dataEntryItems objectForKeyedSubscript:v5];
  if (!v6)
  {
    switch(a3)
    {
      case 0:
        int v7 = [HKSimpleDataEntryPlainTextItem alloc];
        uint64_t v8 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        id v9 = [v8 localizedStringForKey:@"OD_FIRST_NAME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        uint64_t v10 = [(HKOrganDonationRegistrant *)self firstname];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v7 initWithTitle:v9 registrantModelKey:@"firstname" defaultText:v10 intention:0];

        uint64_t v11 = self;
        uint64_t v12 = 0;
        goto LABEL_17;
      case 1:
        uint64_t v13 = [HKSimpleDataEntryPlainTextItem alloc];
        uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v15 = [v14 localizedStringForKey:@"OD_MIDDLE_NAME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        uint64_t v16 = [(HKOrganDonationRegistrant *)self middlename];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v13 initWithTitle:v15 registrantModelKey:@"middlename" defaultText:v16 intention:1];

        uint64_t v11 = self;
        uint64_t v12 = 1;
        goto LABEL_17;
      case 2:
        v17 = [HKSimpleDataEntryPlainTextItem alloc];
        uint64_t v18 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v19 = [v18 localizedStringForKey:@"OD_LAST_NAME" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        uint64_t v20 = [(HKOrganDonationRegistrant *)self lastname];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v17 initWithTitle:v19 registrantModelKey:@"lastname" defaultText:v20 intention:2];

        uint64_t v11 = self;
        uint64_t v12 = 2;
        goto LABEL_17;
      case 3:
        BOOL v6 = [(HKOrganDonationRegistrant *)self _createDateOfBirthEntryItem];
        break;
      case 4:
        v21 = [HKSimpleDataEntryMultipleChoiceItem alloc];
        v63 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v22 = [v63 localizedStringForKey:@"OD_BIOLOGICAL_SEX" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v65[0] = &stru_1F3B9CF20;
        v65[1] = @"M";
        v65[2] = @"F";
        v65[3] = @"O";
        v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v65 count:4];
        v64[0] = &stru_1F3B9CF20;
        v62 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v61 = [v62 localizedStringForKey:@"OD_MALE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v64[1] = v61;
        v60 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v23 = [v60 localizedStringForKey:@"OD_FEMALE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v64[2] = v23;
        uint64_t v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v25 = [v24 localizedStringForKey:@"OD_SEX_OTHER" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v64[3] = v25;
        uint64_t v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:4];
        uint64_t v27 = [(HKOrganDonationRegistrant *)self sex];
        BOOL v6 = [(HKSimpleDataEntryMultipleChoiceItem *)v21 initWithTitle:v22 registrantModelKey:@"sex" choices:v59 choiceDisplayNames:v26 defaultChoice:v27];

        uint64_t v11 = self;
        uint64_t v12 = 4;
        goto LABEL_17;
      case 5:
        uint64_t v28 = [HKSimpleDataEntryPlainTextItem alloc];
        v29 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v30 = [v29 localizedStringForKey:@"OD_EMAIL" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        objc_super v31 = [(HKOrganDonationRegistrant *)self email];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v28 initWithTitle:v30 registrantModelKey:@"email" defaultText:v31 intention:3];

        uint64_t v11 = self;
        uint64_t v12 = 5;
        goto LABEL_17;
      case 6:
        BOOL v6 = [[HKOrganDonationAddressEntryItem alloc] initWithRegistrant:self];
        uint64_t v11 = self;
        uint64_t v12 = 6;
        goto LABEL_17;
      case 7:
        v32 = [HKSimpleDataEntryPlainTextItem alloc];
        v33 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v34 = [v33 localizedStringForKey:@"OD_ADDRESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v35 = [(HKOrganDonationRegistrant *)self address1];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v32 initWithTitle:v34 registrantModelKey:@"address1" defaultText:v35 intention:4];

        uint64_t v11 = self;
        uint64_t v12 = 7;
        goto LABEL_17;
      case 8:
        v36 = [HKSimpleDataEntryPlainTextItem alloc];
        v37 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v38 = [v37 localizedStringForKey:@"OD_ADDRESS" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v39 = [(HKOrganDonationRegistrant *)self address2];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v36 initWithTitle:v38 registrantModelKey:@"address2" defaultText:v39 intention:5];

        uint64_t v11 = self;
        uint64_t v12 = 8;
        goto LABEL_17;
      case 9:
        v40 = [HKSimpleDataEntryPlainTextItem alloc];
        v41 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v42 = [v41 localizedStringForKey:@"OD_ADDRESS_CITY" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v43 = [(HKOrganDonationRegistrant *)self city];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v40 initWithTitle:v42 registrantModelKey:@"city" defaultText:v43 intention:6];

        uint64_t v11 = self;
        uint64_t v12 = 9;
        goto LABEL_17;
      case 10:
        v44 = [HKSimpleDataEntryMultipleChoiceItem alloc];
        uint64_t v45 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v46 = [v45 localizedStringForKey:@"OD_ADDRESS_STATE" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        uint64_t v47 = [(HKOrganDonationRegistrant *)self _stateChoiceValues];
        uint64_t v48 = [(HKOrganDonationRegistrant *)self _stateChoiceDisplayNames];
        v49 = [(HKOrganDonationRegistrant *)self state];
        BOOL v6 = [(HKSimpleDataEntryMultipleChoiceItem *)v44 initWithTitle:v46 registrantModelKey:@"state" choices:v47 choiceDisplayNames:v48 defaultChoice:v49];

        uint64_t v11 = self;
        uint64_t v12 = 10;
        goto LABEL_17;
      case 11:
        v50 = [HKSimpleDataEntryPlainTextItem alloc];
        v51 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        uint64_t v52 = [v51 localizedStringForKey:@"OD_ADDRESS_ZIP" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v53 = [(HKOrganDonationRegistrant *)self zip];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v50 initWithTitle:v52 registrantModelKey:@"zip" defaultText:v53 intention:7];

        uint64_t v11 = self;
        uint64_t v12 = 11;
        goto LABEL_17;
      case 12:
        int v54 = [HKSimpleDataEntryPlainTextItem alloc];
        uint64_t v55 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
        v56 = [v55 localizedStringForKey:@"OD_SSN" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
        v57 = [(HKOrganDonationRegistrant *)self last4SSN];
        BOOL v6 = [(HKSimpleDataEntryPlainTextItem *)v54 initWithTitle:v56 registrantModelKey:@"last4SSN" defaultText:v57 intention:8];

        uint64_t v11 = self;
        uint64_t v12 = 12;
LABEL_17:
        [(HKSimpleDataEntryItem *)v6 setPlaceholderType:[(HKOrganDonationRegistrant *)v11 _placeHolderTypeForField:v12]];
        [(HKSimpleDataEntryItem *)v6 setDelegate:self];
        break;
      default:
        BOOL v6 = 0;
        break;
    }
    [(NSMutableDictionary *)self->_dataEntryItems setObject:v6 forKeyedSubscript:v5];
  }

  return v6;
}

- (unint64_t)_placeHolderTypeForField:(int64_t)a3
{
  return a3 != 8 && a3 != 1;
}

- (BOOL)isFieldValid:(int64_t)a3
{
  LOBYTE(email) = 1;
  switch(a3)
  {
    case 0:
      firstname = self->_firstname;
      goto LABEL_12;
    case 1:
      firstname = self->_middlename;
      goto LABEL_12;
    case 2:
      firstname = self->_lastname;
      goto LABEL_12;
    case 3:
      BOOL v6 = [(id)objc_opt_class() exportDateFormatter];
      int v7 = [v6 dateFromString:self->_dob];
      LOBYTE(email) = v7 != 0;

      return (char)email;
    case 4:
      LOBYTE(email) = [(NSString *)self->_sex length] == 1;
      return (char)email;
    case 5:
      email = self->_email;
      if (email)
      {
        uint64_t v8 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
        id v9 = [(NSString *)email stringByTrimmingCharactersInSet:v8];
        LOBYTE(email) = [v9 rangeOfString:@"^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,}$" options:1025] != 0x7FFFFFFFFFFFFFFFLL;
      }
      return (char)email;
    case 7:
      firstname = self->_address1;
      goto LABEL_12;
    case 8:
      firstname = self->_address2;
      goto LABEL_12;
    case 9:
      firstname = self->_city;
LABEL_12:
      BOOL v10 = [(NSString *)firstname length] == 0;
      goto LABEL_13;
    case 10:
      BOOL v10 = [(id)_sortedStateAbbreviations indexOfObject:self->_state] == 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
      LOBYTE(email) = !v10;
      return (char)email;
    case 11:
      if (!self->_zip) {
        goto LABEL_25;
      }
      uint64_t v12 = objc_opt_class();
      zip = self->_zip;
      uint64_t v14 = 5;
      goto LABEL_22;
    case 12:
      if (self->_last4SSN)
      {
        uint64_t v12 = objc_opt_class();
        zip = self->_last4SSN;
        uint64_t v14 = 4;
LABEL_22:
        return [v12 _isNumericStringValid:zip withLength:v14];
      }
      else
      {
LABEL_25:
        LOBYTE(email) = 0;
        return (char)email;
      }
    default:
      return (char)email;
  }
}

- (BOOL)isRegistrantValid
{
  if (![(HKOrganDonationRegistrant *)self isFieldValid:0]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:2]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:5]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:4]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:3]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:7]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:9]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:10]
    || ![(HKOrganDonationRegistrant *)self isFieldValid:11])
  {
    return 0;
  }
  return [(HKOrganDonationRegistrant *)self isFieldValid:12];
}

- (NSNumber)age
{
  if (self->_dob)
  {
    BOOL v3 = [(id)objc_opt_class() exportDateFormatter];
    id v4 = [v3 dateFromString:self->_dob];

    if (v4)
    {
      id v5 = +[HKSimpleDataEntryDateItem gregorianGMTCalendar];
      BOOL v6 = objc_msgSend(v5, "hk_dateOfBirthDateComponentsWithDate:", v4);

      int v7 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      uint64_t v8 = [(HKOrganDonationRegistrant *)self _todayBirthdayDateComponents];
      id v9 = [v7 components:4 fromDateComponents:v6 toDateComponents:v8 options:0];

      BOOL v10 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v9, "year"));
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }
  return (NSNumber *)v10;
}

+ (id)exportDateFormatter
{
  v2 = (void *)exportDateFormatter___dateFormatter;
  if (!exportDateFormatter___dateFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    id v4 = (void *)exportDateFormatter___dateFormatter;
    exportDateFormatter___dateFormatter = (uint64_t)v3;

    id v5 = (void *)exportDateFormatter___dateFormatter;
    BOOL v6 = +[HKSimpleDataEntryDateItem gregorianGMTCalendar];
    [v5 setCalendar:v6];

    int v7 = (void *)exportDateFormatter___dateFormatter;
    uint64_t v8 = +[HKSimpleDataEntryDateItem gregorianGMTCalendar];
    id v9 = [v8 timeZone];
    [v7 setTimeZone:v9];

    [(id)exportDateFormatter___dateFormatter setDateFormat:@"MM/dd/yyyy"];
    BOOL v10 = (void *)exportDateFormatter___dateFormatter;
    uint64_t v11 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"_US"];
    [v10 setLocale:v11];

    v2 = (void *)exportDateFormatter___dateFormatter;
  }
  return v2;
}

+ (id)zipcodeNumberFormatter
{
  v2 = (void *)zipcodeNumberFormatter__numberFormatter;
  if (!zipcodeNumberFormatter__numberFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v4 = (void *)zipcodeNumberFormatter__numberFormatter;
    zipcodeNumberFormatter__numberFormatter = (uint64_t)v3;

    [(id)zipcodeNumberFormatter__numberFormatter setNumberStyle:0];
    [(id)zipcodeNumberFormatter__numberFormatter setFormatWidth:5];
    [(id)zipcodeNumberFormatter__numberFormatter setPaddingCharacter:@"0"];
    id v5 = (void *)zipcodeNumberFormatter__numberFormatter;
    BOOL v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"_US"];
    [v5 setLocale:v6];

    v2 = (void *)zipcodeNumberFormatter__numberFormatter;
  }
  return v2;
}

+ (id)ssnNumberFormatter
{
  v2 = (void *)ssnNumberFormatter__numberFormatter;
  if (!ssnNumberFormatter__numberFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v4 = (void *)ssnNumberFormatter__numberFormatter;
    ssnNumberFormatter__numberFormatter = (uint64_t)v3;

    [(id)ssnNumberFormatter__numberFormatter setNumberStyle:0];
    [(id)ssnNumberFormatter__numberFormatter setFormatWidth:4];
    [(id)ssnNumberFormatter__numberFormatter setPaddingCharacter:@"0"];
    id v5 = (void *)ssnNumberFormatter__numberFormatter;
    BOOL v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"_US"];
    [v5 setLocale:v6];

    v2 = (void *)ssnNumberFormatter__numberFormatter;
  }
  return v2;
}

+ (id)_importNumberFormatter
{
  v2 = (void *)_importNumberFormatter__numberFormatter;
  if (!_importNumberFormatter__numberFormatter)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    id v4 = (void *)_importNumberFormatter__numberFormatter;
    _importNumberFormatter__numberFormatter = (uint64_t)v3;

    [(id)_importNumberFormatter__numberFormatter setNumberStyle:0];
    v2 = (void *)_importNumberFormatter__numberFormatter;
  }
  return v2;
}

+ (BOOL)_isNumericStringValid:(id)a3 withLength:(int64_t)a4
{
  id v5 = [MEMORY[0x1E4F28FE8] localizedScannerWithString:a3];
  BOOL v6 = [MEMORY[0x1E4F28B88] decimalDigitCharacterSet];
  id v10 = 0;
  [v5 scanCharactersFromSet:v6 intoString:&v10];
  id v7 = v10;

  uint64_t v8 = [v7 length];
  return v8 == a4;
}

+ (id)convertLocalizedNumericStringToLatin:(id)a3 withNumberFormatter:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _importNumberFormatter];
  uint64_t v8 = [v7 numberFromString:v6];

  id v9 = [v5 stringFromNumber:v8];

  return v9;
}

- (id)_todayBirthdayDateComponents
{
  v2 = +[HKSimpleDataEntryDateItem gregorianGMTCalendar];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = objc_msgSend(v2, "hk_dateOfBirthDateComponentsWithDate:", v3);

  return v4;
}

- (id)_createDateOfBirthEntryItem
{
  uint64_t v3 = [(HKOrganDonationRegistrant *)self _todayBirthdayDateComponents];
  id v4 = +[HKSimpleDataEntryDateItem gregorianGMTCalendar];
  uint64_t v18 = (void *)v3;
  id v5 = [v4 dateFromComponents:v3];
  uint64_t v6 = [v4 dateByAddingUnit:4 value:-130 toDate:v5 options:0];
  v17 = [v4 dateByAddingUnit:4 value:-30 toDate:v5 options:0];
  if ([(NSString *)self->_dob length])
  {
    id v7 = [(id)objc_opt_class() exportDateFormatter];
    uint64_t v8 = [v7 dateFromString:self->_dob];
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = [HKSimpleDataEntryDateItem alloc];
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
  uint64_t v11 = [v10 localizedStringForKey:@"OD_DATE_OF_BIRTH" value:&stru_1F3B9CF20 table:@"HealthUI-Localizable"];
  uint64_t v12 = +[HKValueRange valueRangeWithMinValue:v6 maxValue:v5];
  [(id)objc_opt_class() exportDateFormatter];
  uint64_t v13 = v16 = (void *)v6;
  uint64_t v14 = [(HKSimpleDataEntryDateItem *)v9 initWithTitle:v11 registrantModelKey:@"dob" date:v8 defaultDate:v17 dateRange:v12 exportFormatter:v13];

  [(HKSimpleDataEntryItem *)v14 setPlaceholderType:[(HKOrganDonationRegistrant *)self _placeHolderTypeForField:3]];
  [(HKSimpleDataEntryItem *)v14 setDelegate:self];

  return v14;
}

- (id)_stateChoiceDisplayNames
{
  [(id)objc_opt_class() _loadStateInformationIfNeeded];
  v2 = (void *)_sortedStateNames;
  return v2;
}

- (id)_stateChoiceValues
{
  [(id)objc_opt_class() _loadStateInformationIfNeeded];
  v2 = (void *)_sortedStateAbbreviations;
  return v2;
}

+ (void)_loadStateInformationIfNeeded
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (_sortedStateNames) {
    BOOL v2 = _sortedStateAbbreviations == 0;
  }
  else {
    BOOL v2 = 1;
  }
  if (v2)
  {
    uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
    id v4 = HKHealthUIFrameworkBundle();
    id v5 = [v4 pathForResource:@"USStateAbbreviations" ofType:@"plist"];
    uint64_t v6 = [v3 dictionaryWithContentsOfFile:v5];

    v32 = v6;
    id v7 = [v6 allKeys];
    v33 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    obuint64_t j = v7;
    uint64_t v9 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v39 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.HealthUI"];
          v15 = [v32 objectForKeyedSubscript:v13];
          uint64_t v16 = [v14 localizedStringForKey:v15 value:&stru_1F3B9CF20 table:@"HealthUI-Localizable-USState"];

          [v33 addObject:v16];
          [v8 setObject:v13 forKey:v16];
        }
        uint64_t v10 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v10);
    }

    v17 = [v33 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    uint64_t v18 = (void *)[v17 mutableCopy];

    [v18 insertObject:&stru_1F3B9CF20 atIndex:0];
    v19 = [MEMORY[0x1E4F1CA48] array];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = v18;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v20);
          }
          uint64_t v25 = [v8 objectForKeyedSubscript:*(void *)(*((void *)&v34 + 1) + 8 * j)];
          uint64_t v26 = (void *)v25;
          if (v25) {
            uint64_t v27 = (__CFString *)v25;
          }
          else {
            uint64_t v27 = &stru_1F3B9CF20;
          }
          [v19 addObject:v27];
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v42 count:16];
      }
      while (v22);
    }

    uint64_t v28 = (void *)_sortedStateNames;
    _sortedStateNames = (uint64_t)v20;
    id v29 = v20;

    v30 = (void *)_sortedStateAbbreviations;
    _sortedStateAbbreviations = (uint64_t)v19;
  }
}

- (void)dataEntryItemDidUpdateValue:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 formattedKeyAndValue];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        uint64_t v11 = [(HKOrganDonationRegistrant *)self valueForKey:v9];
        if (([v10 isEqualToString:v11] & 1) == 0)
        {
          [(HKOrganDonationRegistrant *)self setValue:v10 forKey:v9];
          self->_hasEdits = 1;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
  uint64_t v12 = [(HKOrganDonationRegistrant *)self delegate];
  [v12 organDonationRegistrantDidUpdateValue:self];
}

- (HKOrganDonationRegistrantDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKOrganDonationRegistrantDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)firstname
{
  return self->_firstname;
}

- (void)setFirstname:(id)a3
{
}

- (NSString)middlename
{
  return self->_middlename;
}

- (void)setMiddlename:(id)a3
{
}

- (NSString)lastname
{
  return self->_lastname;
}

- (void)setLastname:(id)a3
{
}

- (NSString)address1
{
  return self->_address1;
}

- (void)setAddress1:(id)a3
{
}

- (NSString)address2
{
  return self->_address2;
}

- (void)setAddress2:(id)a3
{
}

- (NSString)zip
{
  return self->_zip;
}

- (void)setZip:(id)a3
{
}

- (NSString)city
{
  return self->_city;
}

- (void)setCity:(id)a3
{
}

- (NSString)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
}

- (NSString)last4SSN
{
  return self->_last4SSN;
}

- (void)setLast4SSN:(id)a3
{
}

- (NSString)sex
{
  return self->_sex;
}

- (void)setSex:(id)a3
{
}

- (NSString)dob
{
  return self->_dob;
}

- (void)setDob:(id)a3
{
}

- (BOOL)hasEdits
{
  return self->_hasEdits;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dob, 0);
  objc_storeStrong((id *)&self->_sex, 0);
  objc_storeStrong((id *)&self->_last4SSN, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_city, 0);
  objc_storeStrong((id *)&self->_zip, 0);
  objc_storeStrong((id *)&self->_address2, 0);
  objc_storeStrong((id *)&self->_address1, 0);
  objc_storeStrong((id *)&self->_lastname, 0);
  objc_storeStrong((id *)&self->_middlename, 0);
  objc_storeStrong((id *)&self->_firstname, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dataEntryItems, 0);
}

@end