@interface WFContact
+ (BOOL)supportsSecureCoding;
+ (Class)preferredConcreteSubclass;
+ (id)addContactsChangeObserver:(id)a3;
+ (id)cnContactWithINPerson:(id)a3;
+ (id)contactWithVCardData:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5;
+ (id)contactsWithVCardData:(id)a3;
+ (id)labelFromINPersonHandleLabel:(id)a3;
+ (id)objectWithWFSerializedRepresentation:(id)a3;
+ (int64_t)predictedTypeForHandleValue:(id)a3;
+ (int64_t)predictedTypeForHandleValue:(id)a3 allowsCustomHandles:(BOOL)a4;
+ (void)removeContactsChangeObserver:(id)a3;
- (BOOL)hasImageData;
- (BOOL)hasValueForPropertyID:(int)a3;
- (NSArray)URLs;
- (NSArray)dates;
- (NSArray)emailAddresses;
- (NSArray)instantMessageAddresses;
- (NSArray)phoneNumbers;
- (NSArray)socialProfiles;
- (NSArray)streetAddresses;
- (NSData)imageData;
- (NSData)thumbnailImageData;
- (NSDate)creationDate;
- (NSDate)modificationDate;
- (NSString)description;
- (NSString)firstName;
- (NSString)formattedName;
- (NSString)lastName;
- (NSString)middleName;
- (NSString)namePrefix;
- (NSString)nameSuffix;
- (NSString)nickname;
- (NSString)organization;
- (WFContact)contactWithPropertyID:(int)a3 multivalueIndex:(int64_t)a4;
- (WFContact)initWithCoder:(id)a3;
- (WFContactLabeledValue)birthday;
- (WFFileRepresentation)fullDataVCardRepresentation;
- (WFFileRepresentation)vCardRepresentation;
- (id)INPersonRepresentation;
- (id)attributionSetWithCachingIdentifier:(id)a3;
- (id)contactIdentifierForINPerson;
- (id)copyWithZone:(_NSZone *)a3;
- (id)vCardRepresentationWithFullData:(BOOL)a3;
- (id)valueForPropertyID:(int)a3;
- (id)wfSerializedRepresentation;
- (int)propertyID;
- (int64_t)multivalueIndex;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_nickname, 0);
  objc_storeStrong((id *)&self->_fullDataVCardRepresentation, 0);
  objc_storeStrong((id *)&self->_vCardRepresentation, 0);
}

- (NSArray)socialProfiles
{
  return self->_socialProfiles;
}

- (BOOL)hasImageData
{
  return self->_hasImageData;
}

- (NSString)nickname
{
  return self->_nickname;
}

- (int64_t)multivalueIndex
{
  return self->_multivalueIndex;
}

- (int)propertyID
{
  return self->_propertyID;
}

- (id)wfSerializedRepresentation
{
  v14[3] = *MEMORY[0x263EF8340];
  v3 = [(WFContact *)self vCardRepresentation];
  v4 = [v3 data];

  if (v4)
  {
    int64_t v5 = [(WFContact *)self multivalueIndex];
    v14[0] = v4;
    v13[0] = @"WFContactData";
    v13[1] = @"WFContactProperty";
    v6 = objc_msgSend(NSNumber, "numberWithInt:", -[WFContact propertyID](self, "propertyID"));
    v14[1] = v6;
    v13[2] = @"WFContactMultivalue";
    v7 = [NSNumber numberWithLongLong:v5];
    v14[2] = v7;
    v8 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];

    v11 = @"link.contentkit.contact";
    v12 = v8;
    v9 = [NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(WFContact *)self fullDataVCardRepresentation];
  [v4 encodeObject:v5 forKey:@"vCardFile"];

  v6 = objc_msgSend(NSNumber, "numberWithInt:", -[WFContact propertyID](self, "propertyID"));
  [v4 encodeObject:v6 forKey:@"propertyId"];

  objc_msgSend(NSNumber, "numberWithLong:", -[WFContact multivalueIndex](self, "multivalueIndex"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [v4 encodeObject:v7 forKey:@"multivalueId"];
}

- (WFContact)initWithCoder:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"vCardFile"];
  v6 = [v5 data];
  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"propertyId"];
  uint64_t v8 = [v7 integerValue];

  v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"multivalueId"];

  uint64_t v10 = [v9 longValue];
  v11 = [(id)objc_opt_class() contactWithVCardData:v6 propertyID:v8 multivalueIndex:v10];

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v3 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  return (id)[v3 init];
}

- (NSString)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFContact;
  id v4 = [(WFContact *)&v8 description];
  int64_t v5 = [(WFContact *)self formattedName];
  v6 = [v3 stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (NSArray)instantMessageAddresses
{
  return 0;
}

- (NSArray)URLs
{
  return 0;
}

- (NSArray)streetAddresses
{
  return 0;
}

- (NSArray)emailAddresses
{
  return 0;
}

- (NSArray)phoneNumbers
{
  return 0;
}

- (NSArray)dates
{
  return 0;
}

- (NSDate)modificationDate
{
  return (NSDate *)[(WFContact *)self valueForPropertyID:27];
}

- (NSDate)creationDate
{
  return (NSDate *)[(WFContact *)self valueForPropertyID:26];
}

- (WFContactLabeledValue)birthday
{
  return 0;
}

- (NSData)thumbnailImageData
{
  return 0;
}

- (NSData)imageData
{
  return 0;
}

- (NSString)organization
{
  return 0;
}

- (NSString)nameSuffix
{
  return 0;
}

- (NSString)lastName
{
  return 0;
}

- (NSString)middleName
{
  return 0;
}

- (NSString)firstName
{
  return 0;
}

- (NSString)namePrefix
{
  return 0;
}

- (NSString)formattedName
{
  return 0;
}

- (id)attributionSetWithCachingIdentifier:(id)a3
{
  return 0;
}

- (id)vCardRepresentationWithFullData:(BOOL)a3
{
  return 0;
}

- (WFFileRepresentation)fullDataVCardRepresentation
{
  fullDataVCardRepresentation = self->_fullDataVCardRepresentation;
  if (!fullDataVCardRepresentation)
  {
    id v4 = [(WFContact *)self vCardRepresentationWithFullData:1];
    int64_t v5 = self->_fullDataVCardRepresentation;
    self->_fullDataVCardRepresentation = v4;

    fullDataVCardRepresentation = self->_fullDataVCardRepresentation;
  }
  return fullDataVCardRepresentation;
}

- (WFFileRepresentation)vCardRepresentation
{
  vCardRepresentation = self->_vCardRepresentation;
  if (!vCardRepresentation)
  {
    id v4 = [(WFContact *)self vCardRepresentationWithFullData:0];
    int64_t v5 = self->_vCardRepresentation;
    self->_vCardRepresentation = v4;

    vCardRepresentation = self->_vCardRepresentation;
  }
  return vCardRepresentation;
}

- (WFContact)contactWithPropertyID:(int)a3 multivalueIndex:(int64_t)a4
{
  return 0;
}

- (id)valueForPropertyID:(int)a3
{
  return 0;
}

- (BOOL)hasValueForPropertyID:(int)a3
{
  return 0;
}

+ (id)objectWithWFSerializedRepresentation:(id)a3
{
  id v4 = a3;
  int64_t v5 = [v4 wfObjectOfClass:objc_opt_class() forKey:@"link.contentkit.contact"];
  v6 = [v5 objectForKeyedSubscript:@"WFIsINPerson"];
  int v7 = [v6 BOOLValue];

  if (v7)
  {
    objc_super v8 = +[WFINPersonContact objectWithWFSerializedRepresentation:v4];
  }
  else
  {
    v9 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"WFContactData"];
    uint64_t v10 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"WFContactProperty"];
    unsigned int v11 = [v10 intValue];

    v12 = [v5 wfObjectOfClass:objc_opt_class() forKey:@"WFContactMultivalue"];
    uint64_t v13 = [v12 longLongValue];

    if (v13 == 0x7FFFFFFF || v13 == 0x7FFFFFFFFFFFFFFFLL) {
      uint64_t v15 = -1;
    }
    else {
      uint64_t v15 = v13;
    }
    if (v11 - 3 < 2 && v15 == -1) {
      uint64_t v17 = 0xFFFFFFFFLL;
    }
    else {
      uint64_t v17 = v11;
    }
    objc_super v8 = [a1 contactWithVCardData:v9 propertyID:v17 multivalueIndex:v15];
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)removeContactsChangeObserver:(id)a3
{
  id v4 = a3;
  objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "removeContactsChangeObserver:", v4);
}

+ (id)addContactsChangeObserver:(id)a3
{
  id v4 = a3;
  int64_t v5 = objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "addContactsChangeObserver:", v4);

  return v5;
}

+ (int64_t)predictedTypeForHandleValue:(id)a3 allowsCustomHandles:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = +[WFEmailAddress stringContainsEmailAddresses:v5];
  BOOL v7 = +[WFPhoneNumber stringContainsPhoneNumbers:v5];

  if (v6 && !v7) {
    return 1;
  }
  if (v7 && !v6) {
    return 0;
  }
  int64_t v9 = 2;
  if (!v4) {
    int64_t v9 = 0;
  }
  if (!v6 || !v7) {
    return v9;
  }
  else {
    return 1;
  }
}

+ (int64_t)predictedTypeForHandleValue:(id)a3
{
  return [a1 predictedTypeForHandleValue:a3 allowsCustomHandles:0];
}

+ (id)contactWithVCardData:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int64_t v9 = objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "contactWithVCardData:propertyID:multivalueIndex:", v8, v6, a5);

  return v9;
}

+ (id)contactsWithVCardData:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend((id)objc_msgSend(a1, "preferredConcreteSubclass"), "contactsWithVCardData:", v4);

  return v5;
}

+ (Class)preferredConcreteSubclass
{
  return (Class)objc_opt_class();
}

- (id)contactIdentifierForINPerson
{
  return 0;
}

- (id)INPersonRepresentation
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  id v4 = [(WFContact *)self namePrefix];
  [v3 setNamePrefix:v4];

  id v5 = [(WFContact *)self firstName];
  [v3 setGivenName:v5];

  uint64_t v6 = [(WFContact *)self middleName];
  [v3 setMiddleName:v6];

  BOOL v7 = [(WFContact *)self lastName];
  [v3 setFamilyName:v7];

  id v8 = [(WFContact *)self nameSuffix];
  [v3 setNameSuffix:v8];

  int64_t v9 = [(WFContact *)self nickname];
  v44 = v3;
  [v3 setNickname:v9];

  uint64_t v10 = objc_opt_new();
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v45 = self;
  obuint64_t j = [(WFContact *)self phoneNumbers];
  uint64_t v11 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v53 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v52 + 1) + 8 * i);
        id v16 = objc_alloc(MEMORY[0x263F0FD20]);
        uint64_t v17 = [v15 value];
        v18 = [v17 normalizedPhoneNumber];
        v19 = [v15 value];
        v20 = [v19 label];
        v21 = INPersonHandleLabelForContactLabel(v20);
        v22 = (void *)[v16 initWithValue:v18 type:2 label:v21];

        [v10 addObject:v22];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v52 objects:v57 count:16];
    }
    while (v12);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obja = [(WFContact *)v45 emailAddresses];
  uint64_t v23 = [obja countByEnumeratingWithState:&v48 objects:v56 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v49;
    do
    {
      for (uint64_t j = 0; j != v24; ++j)
      {
        if (*(void *)v49 != v25) {
          objc_enumerationMutation(obja);
        }
        v27 = *(void **)(*((void *)&v48 + 1) + 8 * j);
        id v28 = objc_alloc(MEMORY[0x263F0FD20]);
        v29 = [v27 value];
        v30 = [v29 address];
        v31 = [v27 value];
        v32 = [v31 label];
        v33 = INPersonHandleLabelForContactLabel(v32);
        v34 = (void *)[v28 initWithValue:v30 type:1 label:v33];

        [v10 addObject:v34];
      }
      uint64_t v24 = [obja countByEnumeratingWithState:&v48 objects:v56 count:16];
    }
    while (v24);
  }

  v35 = [v10 firstObject];
  if ((unint64_t)[v10 count] < 2)
  {

    uint64_t v10 = 0;
  }
  else
  {
    [v10 removeObjectAtIndex:0];
  }
  v36 = [(WFContact *)v45 imageData];
  if ([v36 length])
  {
    v37 = (void *)MEMORY[0x263F0FB88];
    v38 = [(WFContact *)v45 imageData];
    v39 = [v37 imageWithImageData:v38];
  }
  else
  {
    v39 = 0;
  }

  id v40 = objc_alloc(MEMORY[0x263F0FD18]);
  v41 = [(WFContact *)v45 contactIdentifierForINPerson];
  v42 = (void *)[v40 initWithPersonHandle:v35 nameComponents:v44 displayName:0 image:v39 contactIdentifier:v41 customIdentifier:0 aliases:v10 suggestionType:0];

  return v42;
}

+ (id)cnContactWithINPerson:(id)a3
{
  uint64_t v71 = *MEMORY[0x263EF8340];
  id v54 = a3;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2050000000;
  id v4 = (void *)getCNMutableContactClass_softClass;
  uint64_t v69 = getCNMutableContactClass_softClass;
  if (!getCNMutableContactClass_softClass)
  {
    uint64_t v61 = MEMORY[0x263EF8330];
    uint64_t v62 = 3221225472;
    v63 = __getCNMutableContactClass_block_invoke;
    v64 = &unk_26428AC60;
    v65 = &v66;
    __getCNMutableContactClass_block_invoke((uint64_t)&v61);
    id v4 = (void *)v67[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v66, 8);
  long long v53 = objc_opt_new();
  long long v55 = objc_opt_new();
  v56 = objc_opt_new();
  uint64_t v6 = objc_opt_new();
  BOOL v7 = [v54 personHandle];

  if (v7)
  {
    id v8 = [v54 personHandle];
    [v6 addObject:v8];
  }
  int64_t v9 = [v54 aliases];
  [v6 addObjectsFromArray:v9];

  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id v10 = v6;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v70 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        uint64_t v15 = [v14 value];

        if (v15)
        {
          uint64_t v16 = [v14 type];
          if (v16 == 1)
          {
            id CNLabeledValueClass_11543 = getCNLabeledValueClass_11543();
            v18 = [v14 label];
            v19 = [a1 labelFromINPersonHandleLabel:v18];
            v22 = [v14 value];
            uint64_t v23 = [CNLabeledValueClass_11543 labeledValueWithLabel:v19 value:v22];
            [v56 addObject:v23];
          }
          else
          {
            if (v16 != 2) {
              continue;
            }
            id v17 = getCNLabeledValueClass_11543();
            v18 = [v14 label];
            v19 = [a1 labelFromINPersonHandleLabel:v18];
            uint64_t v66 = 0;
            v67 = &v66;
            uint64_t v68 = 0x2050000000;
            v20 = (void *)getCNPhoneNumberClass_softClass_11544;
            uint64_t v69 = getCNPhoneNumberClass_softClass_11544;
            if (!getCNPhoneNumberClass_softClass_11544)
            {
              uint64_t v61 = MEMORY[0x263EF8330];
              uint64_t v62 = 3221225472;
              v63 = __getCNPhoneNumberClass_block_invoke_11545;
              v64 = &unk_26428AC60;
              v65 = &v66;
              __getCNPhoneNumberClass_block_invoke_11545((uint64_t)&v61);
              v20 = (void *)v67[3];
            }
            id v21 = v20;
            _Block_object_dispose(&v66, 8);
            v22 = [v14 value];
            uint64_t v23 = [v21 phoneNumberWithStringValue:v22];
            uint64_t v24 = [v17 labeledValueWithLabel:v19 value:v23];
            [v55 addObject:v24];
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v57 objects:v70 count:16];
    }
    while (v11);
  }

  v26 = [v54 contactIdentifier];
  if (v26 && ![v56 count])
  {
    BOOL v32 = [v55 count] == 0;

    if (v32)
    {
      v27 = objc_alloc_init(WFCNContactStore);
      v33 = [v54 contactIdentifier];
      v34 = [(WFCNContactStore *)v27 contactWithIdentifier:v33];

      goto LABEL_46;
    }
  }
  else
  {
  }
  v27 = [v54 nameComponents];
  if (!v27)
  {
    id v28 = [v54 displayName];
    BOOL v29 = v28 == 0;

    if (v29)
    {
      v27 = 0;
    }
    else
    {
      id v30 = objc_alloc_init(MEMORY[0x263F08A78]);
      v31 = [v54 displayName];
      v27 = [v30 personNameComponentsFromString:v31];
    }
  }
  v35 = [(WFCNContactStore *)v27 namePrefix];

  if (v35)
  {
    v36 = [(WFCNContactStore *)v27 namePrefix];
    [v53 setNamePrefix:v36];
  }
  v37 = [(WFCNContactStore *)v27 nameSuffix];

  if (v37)
  {
    v38 = [(WFCNContactStore *)v27 nameSuffix];
    [v53 setNameSuffix:v38];
  }
  v39 = [(WFCNContactStore *)v27 givenName];

  if (v39)
  {
    id v40 = [(WFCNContactStore *)v27 givenName];
    [v53 setGivenName:v40];
  }
  v41 = [(WFCNContactStore *)v27 middleName];

  if (v41)
  {
    v42 = [(WFCNContactStore *)v27 middleName];
    [v53 setMiddleName:v42];
  }
  v43 = [(WFCNContactStore *)v27 familyName];

  if (v43)
  {
    v44 = [(WFCNContactStore *)v27 familyName];
    [v53 setFamilyName:v44];
  }
  v45 = [(WFCNContactStore *)v27 nickname];

  if (v45)
  {
    v46 = [(WFCNContactStore *)v27 nickname];
    [v53 setNickname:v46];
  }
  v47 = [v54 image];
  if ([v47 _requiresRetrieval]) {
    goto LABEL_44;
  }
  long long v48 = [v54 image];
  long long v49 = [v48 _imageData];
  BOOL v50 = v49 == 0;

  if (!v50)
  {
    v47 = [v54 image];
    long long v51 = [v47 _imageData];
    [v53 setImageData:v51];

LABEL_44:
  }
  [v53 setPhoneNumbers:v55];
  [v53 setEmailAddresses:v56];
  v34 = +[WFCNContact contactWithCNContact:v53];
LABEL_46:

  return v34;
}

+ (id)labelFromINPersonHandleLabel:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263F0F7A8]])
  {
    getCNLabelHome();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7E0]])
  {
    getCNLabelWork();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7C8]])
  {
    getCNLabelOther();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7F0]])
  {
    getCNLabelPhoneNumberiPhone();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7C0]])
  {
    getCNLabelPhoneNumberMobile();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7B8]])
  {
    getCNLabelPhoneNumberMain();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7B0]])
  {
    getCNLabelPhoneNumberHomeFax();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7E8]])
  {
    getCNLabelPhoneNumberWorkFax();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else if ([v3 isEqualToString:*MEMORY[0x263F0F7D0]])
  {
    getCNLabelPhoneNumberPager();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

@end