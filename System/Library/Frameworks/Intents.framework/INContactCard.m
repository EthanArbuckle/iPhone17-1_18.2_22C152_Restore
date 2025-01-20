@interface INContactCard
+ (BOOL)supportsSecureCoding;
+ (id)initWithContactIdentifier:(id)a3 nameComponents:(id)a4 isMe:(BOOL)a5 image:(id)a6 organizationName:(id)a7 departmentName:(id)a8 jobTitle:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 contactRelations:(id)a14 instantMessageAddresses:(id)a15 birthday:(id)a16 dates:(id)a17;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMe;
- (INContactCard)initWithCoder:(id)a3;
- (INContactCard)initWithContactIdentifier:(id)a3 nameComponents:(id)a4 isMe:(BOOL)a5 image:(id)a6 organizationName:(id)a7 departmentName:(id)a8 jobTitle:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 contactRelations:(id)a14 instantMessageAddresses:(id)a15 birthday:(id)a16 dates:(id)a17;
- (INImage)image;
- (NSArray)contactRelations;
- (NSArray)dates;
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)phoneNumbers;
- (NSArray)postalAddresses;
- (NSArray)urlAddresses;
- (NSDateComponents)birthday;
- (NSPersonNameComponents)nameComponents;
- (NSString)contactIdentifier;
- (NSString)departmentName;
- (NSString)jobTitle;
- (NSString)organizationName;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation INContactCard

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_birthday, 0);
  objc_storeStrong((id *)&self->_instantMessageAddresses, 0);
  objc_storeStrong((id *)&self->_contactRelations, 0);
  objc_storeStrong((id *)&self->_urlAddresses, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_jobTitle, 0);
  objc_storeStrong((id *)&self->_departmentName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);

  objc_storeStrong((id *)&self->_contactIdentifier, 0);
}

- (NSArray)dates
{
  return self->_dates;
}

- (NSDateComponents)birthday
{
  return self->_birthday;
}

- (NSArray)instantMessageAddresses
{
  return self->_instantMessageAddresses;
}

- (NSArray)contactRelations
{
  return self->_contactRelations;
}

- (NSArray)urlAddresses
{
  return self->_urlAddresses;
}

- (NSArray)postalAddresses
{
  return self->_postalAddresses;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSString)jobTitle
{
  return self->_jobTitle;
}

- (NSString)departmentName
{
  return self->_departmentName;
}

- (NSString)organizationName
{
  return self->_organizationName;
}

- (INImage)image
{
  return self->_image;
}

- (BOOL)isMe
{
  return self->_isMe;
}

- (NSPersonNameComponents)nameComponents
{
  return self->_nameComponents;
}

- (NSString)contactIdentifier
{
  return self->_contactIdentifier;
}

- (INContactCard)initWithCoder:(id)a3
{
  v74[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v59.receiver = self;
  v59.super_class = (Class)INContactCard;
  v5 = [(INContactCard *)&v59 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"nameComponents"];
    nameComponents = v5->_nameComponents;
    v5->_nameComponents = (NSPersonNameComponents *)v8;

    v5->_isMe = [v4 decodeBoolForKey:@"isMe"];
    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (INImage *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"organizationName"];
    organizationName = v5->_organizationName;
    v5->_organizationName = (NSString *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departmentName"];
    departmentName = v5->_departmentName;
    v5->_departmentName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"jobTitle"];
    jobTitle = v5->_jobTitle;
    v5->_jobTitle = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    v74[0] = objc_opt_class();
    v74[1] = getCNLabeledValueClass_60805();
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2050000000;
    v19 = (void *)getCNPhoneNumberClass_softClass;
    uint64_t v68 = getCNPhoneNumberClass_softClass;
    if (!getCNPhoneNumberClass_softClass)
    {
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = __getCNPhoneNumberClass_block_invoke;
      v63 = &unk_1E5520EB8;
      v64 = &v65;
      __getCNPhoneNumberClass_block_invoke((uint64_t)&v60);
      v19 = (void *)v66[3];
    }
    id v20 = v19;
    _Block_object_dispose(&v65, 8);
    v74[2] = v20;
    v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v74 count:3];
    v22 = [v18 setWithArray:v21];
    uint64_t v23 = [v4 decodeObjectOfClasses:v22 forKey:@"phoneNumbers"];
    phoneNumbers = v5->_phoneNumbers;
    v5->_phoneNumbers = (NSArray *)v23;

    v25 = (void *)MEMORY[0x1E4F1CAD0];
    v73[0] = objc_opt_class();
    v73[1] = getCNLabeledValueClass_60805();
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2050000000;
    v26 = (void *)getCNPostalAddressClass_softClass;
    uint64_t v68 = getCNPostalAddressClass_softClass;
    if (!getCNPostalAddressClass_softClass)
    {
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = __getCNPostalAddressClass_block_invoke;
      v63 = &unk_1E5520EB8;
      v64 = &v65;
      __getCNPostalAddressClass_block_invoke((uint64_t)&v60);
      v26 = (void *)v66[3];
    }
    id v27 = v26;
    _Block_object_dispose(&v65, 8);
    v73[2] = v27;
    v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
    v29 = [v25 setWithArray:v28];
    uint64_t v30 = [v4 decodeObjectOfClasses:v29 forKey:@"postalAddresses"];
    postalAddresses = v5->_postalAddresses;
    v5->_postalAddresses = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E4F1CAD0];
    v72[0] = objc_opt_class();
    v72[1] = getCNLabeledValueClass_60805();
    v72[2] = objc_opt_class();
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:3];
    v34 = [v32 setWithArray:v33];
    uint64_t v35 = [v4 decodeObjectOfClasses:v34 forKey:@"urlAddresses"];
    urlAddresses = v5->_urlAddresses;
    v5->_urlAddresses = (NSArray *)v35;

    v37 = (void *)MEMORY[0x1E4F1CAD0];
    v71[0] = objc_opt_class();
    v71[1] = getCNLabeledValueClass_60805();
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2050000000;
    v38 = (void *)getCNContactRelationClass_softClass;
    uint64_t v68 = getCNContactRelationClass_softClass;
    if (!getCNContactRelationClass_softClass)
    {
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = __getCNContactRelationClass_block_invoke;
      v63 = &unk_1E5520EB8;
      v64 = &v65;
      __getCNContactRelationClass_block_invoke((uint64_t)&v60);
      v38 = (void *)v66[3];
    }
    id v39 = v38;
    _Block_object_dispose(&v65, 8);
    v71[2] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:3];
    v41 = [v37 setWithArray:v40];
    uint64_t v42 = [v4 decodeObjectOfClasses:v41 forKey:@"contactRelations"];
    contactRelations = v5->_contactRelations;
    v5->_contactRelations = (NSArray *)v42;

    v44 = (void *)MEMORY[0x1E4F1CAD0];
    v70[0] = objc_opt_class();
    v70[1] = getCNLabeledValueClass_60805();
    uint64_t v65 = 0;
    v66 = &v65;
    uint64_t v67 = 0x2050000000;
    v45 = (void *)getCNInstantMessageAddressClass_softClass;
    uint64_t v68 = getCNInstantMessageAddressClass_softClass;
    if (!getCNInstantMessageAddressClass_softClass)
    {
      uint64_t v60 = MEMORY[0x1E4F143A8];
      uint64_t v61 = 3221225472;
      v62 = __getCNInstantMessageAddressClass_block_invoke;
      v63 = &unk_1E5520EB8;
      v64 = &v65;
      __getCNInstantMessageAddressClass_block_invoke((uint64_t)&v60);
      v45 = (void *)v66[3];
    }
    id v46 = v45;
    _Block_object_dispose(&v65, 8);
    v70[2] = v46;
    v47 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:3];
    v48 = [v44 setWithArray:v47];
    uint64_t v49 = [v4 decodeObjectOfClasses:v48 forKey:@"instantMessageAddresses"];
    instantMessageAddresses = v5->_instantMessageAddresses;
    v5->_instantMessageAddresses = (NSArray *)v49;

    uint64_t v51 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"birthday"];
    birthday = v5->_birthday;
    v5->_birthday = (NSDateComponents *)v51;

    v53 = (void *)MEMORY[0x1E4F1CAD0];
    v69[0] = objc_opt_class();
    v69[1] = getCNLabeledValueClass_60805();
    v69[2] = objc_opt_class();
    v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
    v55 = [v53 setWithArray:v54];
    uint64_t v56 = [v4 decodeObjectOfClasses:v55 forKey:@"dates"];
    dates = v5->_dates;
    v5->_dates = (NSArray *)v56;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  contactIdentifier = self->_contactIdentifier;
  id v5 = a3;
  [v5 encodeObject:contactIdentifier forKey:@"contactIdentifier"];
  [v5 encodeObject:self->_nameComponents forKey:@"nameComponents"];
  [v5 encodeBool:self->_isMe forKey:@"isMe"];
  [v5 encodeObject:self->_image forKey:@"image"];
  [v5 encodeObject:self->_organizationName forKey:@"organizationName"];
  [v5 encodeObject:self->_departmentName forKey:@"departmentName"];
  [v5 encodeObject:self->_jobTitle forKey:@"jobTitle"];
  [v5 encodeObject:self->_phoneNumbers forKey:@"phoneNumbers"];
  [v5 encodeObject:self->_emailAddresses forKey:@"emailAddresses"];
  [v5 encodeObject:self->_postalAddresses forKey:@"postalAddresses"];
  [v5 encodeObject:self->_urlAddresses forKey:@"urlAddresses"];
  [v5 encodeObject:self->_contactRelations forKey:@"contactRelations"];
  [v5 encodeObject:self->_instantMessageAddresses forKey:@"instantMessageAddresses"];
  [v5 encodeObject:self->_birthday forKey:@"birthday"];
  [v5 encodeObject:self->_dates forKey:@"dates"];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    contactIdentifier = self->_contactIdentifier;
    if (contactIdentifier && v5[1] && (-[NSString isEqual:](contactIdentifier, "isEqual:") & 1) != 0) {
      goto LABEL_5;
    }
    nameComponents = self->_nameComponents;
    if (nameComponents != (NSPersonNameComponents *)v5[2]
      && !-[NSPersonNameComponents isEqual:](nameComponents, "isEqual:"))
    {
      goto LABEL_34;
    }
    if (self->_isMe != *((unsigned __int8 *)v5 + 24)) {
      goto LABEL_34;
    }
    image = self->_image;
    if (image != (INImage *)v5[4] && !-[INImage isEqual:](image, "isEqual:")) {
      goto LABEL_34;
    }
    organizationName = self->_organizationName;
    if (organizationName != (NSString *)v5[5] && !-[NSString isEqual:](organizationName, "isEqual:")) {
      goto LABEL_34;
    }
    departmentName = self->_departmentName;
    if (departmentName != (NSString *)v5[6] && !-[NSString isEqual:](departmentName, "isEqual:")) {
      goto LABEL_34;
    }
    jobTitle = self->_jobTitle;
    if (jobTitle != (NSString *)v5[7] && !-[NSString isEqual:](jobTitle, "isEqual:")) {
      goto LABEL_34;
    }
    phoneNumbers = self->_phoneNumbers;
    if (phoneNumbers != (NSArray *)v5[8] && !-[NSArray isEqual:](phoneNumbers, "isEqual:")) {
      goto LABEL_34;
    }
    if (((emailAddresses = self->_emailAddresses, emailAddresses == (NSArray *)v5[9])
       || -[NSArray isEqual:](emailAddresses, "isEqual:"))
      && ((postalAddresses = self->_postalAddresses, postalAddresses == (NSArray *)v5[10])
       || -[NSArray isEqual:](postalAddresses, "isEqual:"))
      && ((urlAddresses = self->_urlAddresses, urlAddresses == (NSArray *)v5[11])
       || -[NSArray isEqual:](urlAddresses, "isEqual:"))
      && ((contactRelations = self->_contactRelations, contactRelations == (NSArray *)v5[12])
       || -[NSArray isEqual:](contactRelations, "isEqual:"))
      && ((instantMessageAddresses = self->_instantMessageAddresses, instantMessageAddresses == (NSArray *)v5[13])
       || -[NSArray isEqual:](instantMessageAddresses, "isEqual:"))
      && ((birthday = self->_birthday, birthday == (NSDateComponents *)v5[14])
       || -[NSDateComponents isEqual:](birthday, "isEqual:"))
      && ((dates = self->_dates, dates == (NSArray *)v5[15]) || -[NSArray isEqual:](dates, "isEqual:")))
    {
LABEL_5:
      BOOL v7 = 1;
    }
    else
    {
LABEL_34:
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contactIdentifier hash];
  uint64_t v4 = [(NSPersonNameComponents *)self->_nameComponents hash] ^ v3;
  id v5 = [NSNumber numberWithBool:self->_isMe];
  uint64_t v6 = [v5 hash];
  unint64_t v7 = v4 ^ [(INImage *)self->_image hash] ^ v6;
  NSUInteger v8 = [(NSString *)self->_organizationName hash];
  NSUInteger v9 = v8 ^ [(NSString *)self->_departmentName hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_jobTitle hash];
  uint64_t v11 = v7 ^ v10 ^ [(NSArray *)self->_phoneNumbers hash];
  uint64_t v12 = [(NSArray *)self->_emailAddresses hash];
  uint64_t v13 = v12 ^ [(NSArray *)self->_postalAddresses hash];
  uint64_t v14 = v13 ^ [(NSArray *)self->_urlAddresses hash];
  uint64_t v15 = v14 ^ [(NSArray *)self->_contactRelations hash];
  uint64_t v16 = v11 ^ v15 ^ [(NSArray *)self->_instantMessageAddresses hash];
  uint64_t v17 = [(NSDateComponents *)self->_birthday hash];
  unint64_t v18 = v16 ^ v17 ^ [(NSArray *)self->_dates hash];

  return v18;
}

- (INContactCard)initWithContactIdentifier:(id)a3 nameComponents:(id)a4 isMe:(BOOL)a5 image:(id)a6 organizationName:(id)a7 departmentName:(id)a8 jobTitle:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 contactRelations:(id)a14 instantMessageAddresses:(id)a15 birthday:(id)a16 dates:(id)a17
{
  id v21 = a3;
  id v22 = a4;
  id v23 = a6;
  id v24 = a7;
  id v69 = a8;
  v25 = v23;
  id v68 = a9;
  v26 = v22;
  id v67 = a10;
  id v66 = a11;
  id v65 = a12;
  id v27 = v24;
  id v28 = a13;
  id v29 = a14;
  id v30 = a15;
  id v31 = a16;
  id v32 = a17;
  v70.receiver = self;
  v70.super_class = (Class)INContactCard;
  v33 = [(INContactCard *)&v70 init];
  if (v33)
  {
    uint64_t v34 = [v21 copy];
    contactIdentifier = v33->_contactIdentifier;
    v33->_contactIdentifier = (NSString *)v34;

    uint64_t v36 = [v26 copy];
    nameComponents = v33->_nameComponents;
    v33->_nameComponents = (NSPersonNameComponents *)v36;

    v33->_isMe = a5;
    uint64_t v38 = [v25 copy];
    image = v33->_image;
    v33->_image = (INImage *)v38;

    uint64_t v40 = [v27 copy];
    organizationName = v33->_organizationName;
    v33->_organizationName = (NSString *)v40;

    uint64_t v42 = [v69 copy];
    departmentName = v33->_departmentName;
    v33->_departmentName = (NSString *)v42;

    uint64_t v44 = [v68 copy];
    jobTitle = v33->_jobTitle;
    v33->_jobTitle = (NSString *)v44;

    uint64_t v46 = [v67 copy];
    phoneNumbers = v33->_phoneNumbers;
    v33->_phoneNumbers = (NSArray *)v46;

    uint64_t v48 = [v66 copy];
    emailAddresses = v33->_emailAddresses;
    v33->_emailAddresses = (NSArray *)v48;

    uint64_t v50 = [v65 copy];
    postalAddresses = v33->_postalAddresses;
    v33->_postalAddresses = (NSArray *)v50;

    uint64_t v52 = [v28 copy];
    urlAddresses = v33->_urlAddresses;
    v33->_urlAddresses = (NSArray *)v52;

    uint64_t v54 = [v29 copy];
    contactRelations = v33->_contactRelations;
    v33->_contactRelations = (NSArray *)v54;

    uint64_t v56 = [v30 copy];
    instantMessageAddresses = v33->_instantMessageAddresses;
    v33->_instantMessageAddresses = (NSArray *)v56;

    uint64_t v58 = [v31 copy];
    birthday = v33->_birthday;
    v33->_birthday = (NSDateComponents *)v58;

    uint64_t v60 = [v32 copy];
    dates = v33->_dates;
    v33->_dates = (NSArray *)v60;
  }
  return v33;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)initWithContactIdentifier:(id)a3 nameComponents:(id)a4 isMe:(BOOL)a5 image:(id)a6 organizationName:(id)a7 departmentName:(id)a8 jobTitle:(id)a9 phoneNumbers:(id)a10 emailAddresses:(id)a11 postalAddresses:(id)a12 urlAddresses:(id)a13 contactRelations:(id)a14 instantMessageAddresses:(id)a15 birthday:(id)a16 dates:(id)a17
{
  return (id)objc_msgSend(a1, "initWithContactIdentifier:nameComponents:isMe:image:organizationName:departmentName:jobTitle:phoneNumbers:emailAddresses:postalAddresses:urlAddresses:contactRelations:instantMessageAddresses:birthday:dates:", a3, a4, a5, a6, a7, a8);
}

@end