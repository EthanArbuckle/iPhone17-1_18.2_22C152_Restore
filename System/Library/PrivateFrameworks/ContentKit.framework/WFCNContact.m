@interface WFCNContact
+ (BOOL)supportsSecureCoding;
+ (id)addContactsChangeObserver:(id)a3;
+ (id)contactWithCNContact:(id)a3;
+ (id)contactWithCNContact:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5;
+ (id)contactWithVCardData:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5;
+ (id)contactsWithVCardData:(id)a3;
+ (id)lock_changeObservers;
+ (id)requiredKeysToFetch;
+ (void)contactStoreDidChange:(id)a3;
+ (void)lock_updateContactStoreObservation;
+ (void)removeContactsChangeObserver:(id)a3;
- (BOOL)fromVCard;
- (BOOL)hasImageData;
- (BOOL)hasValueForPropertyID:(int)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPropertyIDRepresented:(int)a3;
- (CNContact)contact;
- (NSString)accountIdentifier;
- (NSString)contactIdentifier;
- (WFCNContact)contactWithPropertyID:(int)a3 multivalueIndex:(int64_t)a4;
- (WFCNContact)initWithCNContact:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5 fromVCard:(BOOL)a6;
- (WFCNContact)initWithCoder:(id)a3;
- (id)URLs;
- (id)attributionSetWithCachingIdentifier:(id)a3;
- (id)birthday;
- (id)contactIdentifierForINPerson;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dates;
- (id)emailAddresses;
- (id)firstName;
- (id)formattedName;
- (id)imageData;
- (id)instantMessageAddresses;
- (id)lastName;
- (id)middleName;
- (id)namePrefix;
- (id)nameSuffix;
- (id)nickname;
- (id)organization;
- (id)phoneNumbers;
- (id)socialProfiles;
- (id)streetAddresses;
- (id)thumbnailImageData;
- (id)vCardRepresentationWithFullData:(BOOL)a3;
- (id)valueForPropertyID:(int)a3;
- (int)propertyID;
- (int64_t)multivalueIndex;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)refetchContact;
@end

@implementation WFCNContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactIdentifier, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
}

- (BOOL)fromVCard
{
  return self->_fromVCard;
}

- (CNContact)contact
{
  return self->_contact;
}

- (int64_t)multivalueIndex
{
  return self->_multivalueIndex;
}

- (int)propertyID
{
  return self->_propertyID;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFCNContact;
  id v4 = a3;
  [(WFContact *)&v6 encodeWithCoder:v4];
  v5 = [(WFCNContact *)self contactIdentifier];
  [v4 encodeObject:v5 forKey:@"contactIdentifier"];
}

- (WFCNContact)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFCNContact;
  v5 = [(WFContact *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contactIdentifier"];
    contactIdentifier = v5->_contactIdentifier;
    v5->_contactIdentifier = (NSString *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5 = [(WFCNContact *)self contact];
  uint64_t v6 = objc_msgSend(v4, "initWithCNContact:propertyID:multivalueIndex:fromVCard:", v5, -[WFCNContact propertyID](self, "propertyID"), -[WFCNContact multivalueIndex](self, "multivalueIndex"), -[WFCNContact fromVCard](self, "fromVCard"));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFCNContact *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = [(WFCNContact *)v4 contact];
      uint64_t v6 = [v5 identifier];
      v7 = [(WFCNContact *)self contact];
      v8 = [v7 identifier];
      if ([v6 isEqual:v8]
        && (int v9 = [(WFCNContact *)v4 propertyID], v9 == [(WFCNContact *)self propertyID]))
      {
        uint64_t v10 = [(WFCNContact *)v4 multivalueIndex];
        BOOL v11 = v10 == [(WFCNContact *)self multivalueIndex];
      }
      else
      {
        BOOL v11 = 0;
      }
    }
    else
    {
      BOOL v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  v3 = [(WFCNContact *)self contact];
  unint64_t v4 = [v3 hash] ^ self->_propertyID ^ self->_multivalueIndex ^ 0xCCC;

  return v4;
}

- (id)attributionSetWithCachingIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F0F988]);
  uint64_t v6 = (void *)[v5 initWithBundleIdentifier:*MEMORY[0x263F854E0]];
  v7 = [MEMORY[0x263F0F9B0] sharedResolver];
  v8 = [v7 resolvedAppMatchingDescriptor:v6];

  int v9 = [(WFCNContact *)self accountIdentifier];

  if (v9)
  {
    uint64_t v10 = [(WFCNContact *)self accountIdentifier];
    BOOL v11 = +[WFContentAttributionSet attributionSetWithAccountBasedAppDescriptor:v8 accountIdentifier:v10 disclosureLevel:1 originalItemIdentifier:v4];
  }
  else
  {
    BOOL v11 = +[WFContentAttributionSet attributionSetWithAppDescriptor:v8 disclosureLevel:1 originalItemIdentifier:v4];
  }

  return v11;
}

- (NSString)accountIdentifier
{
  accountIdentifier = self->_accountIdentifier;
  if (!accountIdentifier)
  {
    getCNContactStoreClass();
    id v4 = objc_opt_new();
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    id v5 = (void *)getCNContainerClass_softClass;
    uint64_t v30 = getCNContainerClass_softClass;
    if (!getCNContainerClass_softClass)
    {
      uint64_t v22 = MEMORY[0x263EF8330];
      uint64_t v23 = 3221225472;
      v24 = __getCNContainerClass_block_invoke;
      v25 = &unk_26428AC60;
      v26 = &v27;
      __getCNContainerClass_block_invoke((uint64_t)&v22);
      id v5 = (void *)v28[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v27, 8);
    v7 = [(WFCNContact *)self contact];
    v8 = [v7 identifier];
    int v9 = [v6 predicateForContainerOfContactWithIdentifier:v8];

    uint64_t v10 = [v4 containersMatchingPredicate:v9 error:0];
    BOOL v11 = [v10 firstObject];

    if (v11)
    {
      v12 = [v10 firstObject];
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x2050000000;
      v13 = (void *)getCNAccountClass_softClass;
      uint64_t v30 = getCNAccountClass_softClass;
      if (!getCNAccountClass_softClass)
      {
        uint64_t v22 = MEMORY[0x263EF8330];
        uint64_t v23 = 3221225472;
        v24 = __getCNAccountClass_block_invoke;
        v25 = &unk_26428AC60;
        v26 = &v27;
        __getCNAccountClass_block_invoke((uint64_t)&v22);
        v13 = (void *)v28[3];
      }
      id v14 = v13;
      _Block_object_dispose(&v27, 8);
      v15 = [v12 identifier];
      v16 = [v14 predicateForAccountForContainerWithIdentifier:v15];

      v17 = [v4 accountsMatchingPredicate:v16 error:0];
      v18 = [v17 firstObject];
      v19 = [v18 externalIdentifierString];
      v20 = self->_accountIdentifier;
      self->_accountIdentifier = v19;
    }
    accountIdentifier = self->_accountIdentifier;
  }
  return accountIdentifier;
}

- (id)instantMessageAddresses
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(WFCNContact *)self isPropertyIDRepresented:13])
  {
    v3 = objc_opt_new();
    id v4 = [(WFCNContact *)self contact];
    id v5 = [v4 instantMessageAddresses];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v24) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          BOOL v11 = [v10 value];
          if ([(WFCNContact *)self propertyID] == 13
            && (int64_t v12 = [(WFCNContact *)self multivalueIndex],
                v12 == [v6 indexOfObject:v10]))
          {
            v13 = [(WFCNContact *)self formattedName];
            char v14 = 1;
          }
          else
          {
            id CNLabeledValueClass = getCNLabeledValueClass();
            v16 = [v10 label];
            v17 = [CNLabeledValueClass localizedStringForLabel:v16];
            [MEMORY[0x263EFF960] currentLocale];
            v19 = v18 = v3;
            v13 = [v17 capitalizedStringWithLocale:v19];

            v3 = v18;
            char v14 = 0;
          }
          uint64_t v20 = +[WFContactLabeledValue labeledValueWithLabel:v13 value:v11];
          v21 = (void *)v20;
          if (v14)
          {
            uint64_t v29 = v20;
            id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];

            goto LABEL_17;
          }
          [v3 addObject:v20];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v22 = v3;
LABEL_17:
  }
  else
  {
    id v22 = (id)MEMORY[0x263EFFA68];
  }
  return v22;
}

- (id)socialProfiles
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(WFCNContact *)self isPropertyIDRepresented:46])
  {
    v3 = objc_opt_new();
    id v4 = [(WFCNContact *)self contact];
    id v5 = [v4 socialProfiles];

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v24 = *(void *)v26;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v26 != v24) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          BOOL v11 = [v10 value];
          if ([(WFCNContact *)self propertyID] == 46
            && (int64_t v12 = [(WFCNContact *)self multivalueIndex],
                v12 == [v6 indexOfObject:v10]))
          {
            v13 = [(WFCNContact *)self formattedName];
            char v14 = 1;
          }
          else
          {
            id CNLabeledValueClass = getCNLabeledValueClass();
            v16 = [v10 label];
            v17 = [CNLabeledValueClass localizedStringForLabel:v16];
            [MEMORY[0x263EFF960] currentLocale];
            v19 = v18 = v3;
            v13 = [v17 capitalizedStringWithLocale:v19];

            v3 = v18;
            char v14 = 0;
          }
          uint64_t v20 = +[WFContactLabeledValue labeledValueWithLabel:v13 value:v11];
          v21 = (void *)v20;
          if (v14)
          {
            uint64_t v29 = v20;
            id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];

            goto LABEL_17;
          }
          [v3 addObject:v20];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v25 objects:v30 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }

    id v22 = v3;
LABEL_17:
  }
  else
  {
    id v22 = (id)MEMORY[0x263EFFA68];
  }
  return v22;
}

- (id)URLs
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  if ([(WFCNContact *)self isPropertyIDRepresented:22])
  {
    v32 = objc_opt_new();
    v3 = [(WFCNContact *)self contact];
    id v4 = [v3 urlAddresses];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v34;
      unint64_t v9 = 0x263EFF000uLL;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v11 = *(void **)(*((void *)&v33 + 1) + 8 * v10);
        int64_t v12 = *(void **)(v9 + 2608);
        v13 = [v11 value];
        char v14 = [v12 URLWithString:v13];

        v15 = [v14 scheme];

        if (v15)
        {
          if (v14) {
            goto LABEL_11;
          }
        }
        else
        {
          v16 = *(void **)(v9 + 2608);
          v17 = [v11 value];
          v18 = [@"http://" stringByAppendingString:v17];
          uint64_t v19 = [v16 URLWithString:v18];

          unint64_t v9 = 0x263EFF000;
          char v14 = (void *)v19;
          if (v19)
          {
LABEL_11:
            if ([(WFCNContact *)self propertyID] == 22
              && (int64_t v20 = [(WFCNContact *)self multivalueIndex],
                  v20 == [v5 indexOfObject:v11]))
            {
              v21 = [(WFCNContact *)self formattedName];
              char v22 = 1;
            }
            else
            {
              id CNLabeledValueClass = getCNLabeledValueClass();
              uint64_t v24 = [v11 label];
              long long v25 = [CNLabeledValueClass localizedStringForLabel:v24];
              long long v26 = [MEMORY[0x263EFF960] currentLocale];
              v21 = [v25 capitalizedStringWithLocale:v26];

              unint64_t v9 = 0x263EFF000;
              char v22 = 0;
            }
            uint64_t v27 = +[WFContactLabeledValue labeledValueWithLabel:v21 value:v14];
            long long v28 = (void *)v27;
            if (v22)
            {
              uint64_t v37 = v27;
              id v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v37 count:1];

              uint64_t v29 = v32;
              goto LABEL_22;
            }
            [v32 addObject:v27];
          }
        }
        if (v7 == ++v10)
        {
          uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
          if (v7) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    uint64_t v29 = v32;
    id v30 = v32;
LABEL_22:
  }
  else
  {
    id v30 = (id)MEMORY[0x263EFFA68];
  }
  return v30;
}

- (id)streetAddresses
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  if ([(WFCNContact *)self isPropertyIDRepresented:5])
  {
    long long v28 = objc_opt_new();
    v3 = [(WFCNContact *)self contact];
    id v4 = [v3 postalAddresses];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v29 = v5;
      uint64_t v30 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v32 != v30) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "value", v27);
          BOOL v11 = [v9 label];
          int64_t v12 = +[WFStreetAddress streetAddressWithPostalAddress:v10 label:v11];

          if ([(WFCNContact *)self propertyID] == 5)
          {
            int64_t v13 = [(WFCNContact *)self multivalueIndex];
            BOOL v14 = v13 == [v5 indexOfObject:v9];
          }
          else
          {
            BOOL v14 = 0;
          }
          id CNLabeledValueClass = getCNLabeledValueClass();
          v16 = [v9 label];
          v17 = [CNLabeledValueClass localizedStringForLabel:v16];
          v18 = [MEMORY[0x263EFF960] currentLocale];
          uint64_t v19 = [v17 capitalizedStringWithLocale:v18];

          if (v14)
          {
            id v20 = [(WFCNContact *)self formattedName];
          }
          else
          {
            id v20 = v19;
          }
          v21 = v20;
          uint64_t v22 = +[WFContactLabeledValue labeledValueWithLabel:v20 value:v12];
          uint64_t v23 = (void *)v22;
          if (v14)
          {
            uint64_t v35 = v22;
            uint64_t v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v35 count:1];
          }
          else
          {
            [v28 addObject:v22];
          }

          if (v14)
          {
            id v5 = v29;

            id v25 = (id)v27;
            uint64_t v24 = v28;
            goto LABEL_22;
          }
          id v5 = v29;
        }
        uint64_t v7 = [v29 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v24 = v28;
    id v25 = v28;
LABEL_22:
  }
  else
  {
    id v25 = (id)MEMORY[0x263EFFA68];
  }
  return v25;
}

- (id)emailAddresses
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(WFCNContact *)self isPropertyIDRepresented:4])
  {
    long long v31 = objc_opt_new();
    v3 = [(WFCNContact *)self contact];
    id v4 = [v3 emailAddresses];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      long long v32 = v5;
      uint64_t v33 = *(void *)v35;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v33) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v10 = objc_msgSend(v9, "value", v30);
          uint64_t v11 = [v10 length];

          if (v11)
          {
            int64_t v12 = [v9 value];
            int64_t v13 = [v9 label];
            BOOL v14 = +[WFEmailAddress addressWithEmailAddress:v12 label:v13];

            if ([(WFCNContact *)self propertyID] == 4)
            {
              int64_t v15 = [(WFCNContact *)self multivalueIndex];
              BOOL v16 = v15 == [v5 indexOfObject:v9];
            }
            else
            {
              BOOL v16 = 0;
            }
            v17 = [v9 label];
            if ([v17 length])
            {
              id CNLabeledValueClass = getCNLabeledValueClass();
              uint64_t v19 = [v9 label];
              id v20 = [CNLabeledValueClass localizedStringForLabel:v19];
              v21 = [MEMORY[0x263EFF960] currentLocale];
              uint64_t v22 = [v20 capitalizedStringWithLocale:v21];
            }
            else
            {
              uint64_t v22 = 0;
            }

            if (v16)
            {
              id v23 = [(WFCNContact *)self formattedName];
            }
            else
            {
              id v23 = v22;
            }
            uint64_t v24 = v23;
            uint64_t v25 = +[WFContactLabeledValue labeledValueWithLabel:v23 value:v14];
            long long v26 = (void *)v25;
            if (v16)
            {
              uint64_t v38 = v25;
              uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v38 count:1];
            }
            else
            {
              [v31 addObject:v25];
            }

            if (v16)
            {
              id v5 = v32;

              id v28 = (id)v30;
              uint64_t v27 = v31;
              goto LABEL_27;
            }
            id v5 = v32;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v27 = v31;
    id v28 = v31;
LABEL_27:
  }
  else
  {
    id v28 = (id)MEMORY[0x263EFFA68];
  }
  return v28;
}

- (id)phoneNumbers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if ([(WFCNContact *)self isPropertyIDRepresented:3])
  {
    id v28 = objc_opt_new();
    v3 = [(WFCNContact *)self contact];
    id v4 = [v3 phoneNumbers];

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v31;
      id obj = v5;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v31 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v10 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          uint64_t v11 = [v10 value];
          int64_t v12 = [v11 stringValue];
          int64_t v13 = [(WFCNContact *)self formattedName];
          BOOL v14 = [v10 label];
          int64_t v15 = +[WFPhoneNumber phoneNumberWithPhoneNumberString:v12 contactName:v13 label:v14];

          if (v15)
          {
            if ([(WFCNContact *)self propertyID] == 3
              && (int64_t v16 = [(WFCNContact *)self multivalueIndex],
                  v16 == [obj indexOfObject:v10]))
            {
              v17 = [(WFCNContact *)self formattedName];
              char v18 = 1;
            }
            else
            {
              id CNLabeledValueClass = getCNLabeledValueClass();
              id v20 = [v10 label];
              v21 = [CNLabeledValueClass localizedStringForLabel:v20];
              uint64_t v22 = [MEMORY[0x263EFF960] currentLocale];
              v17 = [v21 capitalizedStringWithLocale:v22];

              char v18 = 0;
            }
            uint64_t v23 = +[WFContactLabeledValue labeledValueWithLabel:v17 value:v15];
            uint64_t v24 = (void *)v23;
            if (v18)
            {
              uint64_t v34 = v23;
              id v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];

              id v5 = obj;
              uint64_t v25 = v28;
              goto LABEL_19;
            }
            [v28 addObject:v23];
          }
        }
        id v5 = obj;
        uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    uint64_t v25 = v28;
    id v26 = v28;
LABEL_19:
  }
  else
  {
    id v26 = (id)MEMORY[0x263EFFA68];
  }
  return v26;
}

- (id)dates
{
  if ([(WFCNContact *)self isPropertyIDRepresented:12])
  {
    v3 = [(WFCNContact *)self contact];
    id v4 = [v3 dates];
    id v5 = objc_msgSend(v4, "if_map:", &__block_literal_global_118);
  }
  else
  {
    id v5 = (void *)MEMORY[0x263EFFA68];
  }
  return v5;
}

id __20__WFCNContact_dates__block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFF8F0];
  id v3 = a2;
  id v4 = [v2 currentCalendar];
  id v5 = [v3 value];
  uint64_t v6 = objc_msgSend(v4, "wf_dateFromComponentsInCurrentTimeZone:", v5);

  id CNLabeledValueClass = getCNLabeledValueClass();
  uint64_t v8 = [v3 label];

  unint64_t v9 = [CNLabeledValueClass localizedStringForLabel:v8];
  uint64_t v10 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v11 = [v9 capitalizedStringWithLocale:v10];

  int64_t v12 = +[WFContactLabeledValue labeledValueWithLabel:v11 value:v6];

  return v12;
}

- (id)birthday
{
  if ([(WFCNContact *)self isPropertyIDRepresented:17])
  {
    id v3 = [(WFCNContact *)self contact];
    id v4 = [v3 birthday];

    if (v4)
    {
      id v5 = [MEMORY[0x263EFF8F0] currentCalendar];
      uint64_t v6 = objc_msgSend(v5, "wf_dateFromComponentsInCurrentTimeZone:", v4);

      if (v6)
      {
        id CNContactClass = getCNContactClass();
        uint64_t v15 = 0;
        int64_t v16 = &v15;
        uint64_t v17 = 0x2020000000;
        uint64_t v8 = (void *)getCNContactBirthdayKeySymbolLoc_ptr_11349;
        uint64_t v18 = getCNContactBirthdayKeySymbolLoc_ptr_11349;
        if (!getCNContactBirthdayKeySymbolLoc_ptr_11349)
        {
          unint64_t v9 = ContactsLibrary_11241();
          v16[3] = (uint64_t)dlsym(v9, "CNContactBirthdayKey");
          getCNContactBirthdayKeySymbolLoc_ptr_11349 = v16[3];
          uint64_t v8 = (void *)v16[3];
        }
        _Block_object_dispose(&v15, 8);
        if (!v8)
        {
          int64_t v13 = [MEMORY[0x263F08690] currentHandler];
          BOOL v14 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactBirthdayKey(void)"];
          objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, @"WFCNContact.m", 49, @"%s", dlerror());

          __break(1u);
          return result;
        }
        uint64_t v10 = [CNContactClass localizedStringForKey:*v8];
        uint64_t v11 = +[WFContactLabeledValue labeledValueWithLabel:v10 value:v6];
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)thumbnailImageData
{
  id v3 = [(WFCNContact *)self contact];
  id v4 = [v3 thumbnailImageData];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(WFCNContact *)self imageData];
  }
  uint64_t v7 = v6;

  return v7;
}

- (id)imageData
{
  v2 = [(WFCNContact *)self contact];
  id v3 = [v2 imageData];

  return v3;
}

- (BOOL)hasImageData
{
  v2 = [(WFCNContact *)self contact];
  char v3 = [v2 imageDataAvailable];

  return v3;
}

- (BOOL)hasValueForPropertyID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (!-[WFCNContact isPropertyIDRepresented:](self, "isPropertyIDRepresented:")) {
    return 0;
  }
  id v5 = [(WFCNContact *)self valueForPropertyID:v3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    BOOL v6 = [v5 count] == 0;
  }
  else {
    BOOL v6 = v5 == 0;
  }
  BOOL v7 = !v6;

  return v7;
}

- (BOOL)isPropertyIDRepresented:(int)a3
{
  if ([(WFCNContact *)self propertyID] == -1) {
    return 1;
  }
  if ([(WFCNContact *)self propertyID] == a3) {
    return [(WFCNContact *)self multivalueIndex] != -1;
  }
  return 0;
}

- (id)organization
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 organizationName];

  return v3;
}

- (id)nickname
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 nickname];

  return v3;
}

- (id)nameSuffix
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 nameSuffix];

  return v3;
}

- (id)lastName
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 familyName];

  return v3;
}

- (id)middleName
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 middleName];

  return v3;
}

- (id)firstName
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 givenName];

  return v3;
}

- (id)namePrefix
{
  v2 = [(WFCNContact *)self contact];
  uint64_t v3 = [v2 namePrefix];

  return v3;
}

- (id)formattedName
{
  v38[3] = *MEMORY[0x263EF8340];
  uint64_t v3 = [getCNContactFormatterClass() descriptorForRequiredKeysForStyle:0];
  id v4 = getCNContactEmailAddressesKey();
  id v5 = getCNContactPhoneNumbersKey();
  v38[0] = v3;
  v38[1] = v4;
  v38[2] = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v38 count:3];
  if ([(CNContact *)self->_contact areKeysAvailable:v6]) {
    goto LABEL_5;
  }
  BOOL v7 = getWFWFContactLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    contact = self->_contact;
    *(_DWORD *)buf = 136315650;
    long long v33 = "-[WFCNContact formattedName]";
    __int16 v34 = 2112;
    long long v35 = v6;
    __int16 v36 = 2112;
    long long v37 = contact;
    _os_log_impl(&dword_216505000, v7, OS_LOG_TYPE_DEFAULT, "%s Required keys %@ are not available for contact %@, re-fetching", buf, 0x20u);
  }

  [(WFCNContact *)self refetchContact];
  unint64_t v9 = self->_contact;
  long long v31 = v3;
  uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];
  LOBYTE(v9) = [(CNContact *)v9 areKeysAvailable:v10];

  if (v9)
  {
LABEL_5:
    id CNContactFormatterClass = getCNContactFormatterClass();
    int64_t v12 = [(WFCNContact *)self contact];
    int64_t v13 = [CNContactFormatterClass stringFromContact:v12 style:0];

    if (v13)
    {
      id v14 = v13;
    }
    else
    {
      WFLocalizedString(@"No Name");
      id v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v15 = v14;
    goto LABEL_9;
  }
  uint64_t v17 = getWFWFContactLogObject();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    long long v33 = "-[WFCNContact formattedName]";
    __int16 v34 = 2112;
    long long v35 = v3;
    _os_log_impl(&dword_216505000, v17, OS_LOG_TYPE_ERROR, "%s Required key %@ still not available, falling back to other contact properties", buf, 0x16u);
  }

  uint64_t v18 = self->_contact;
  long long v30 = v4;
  uint64_t v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v30 count:1];
  LODWORD(v18) = [(CNContact *)v18 areKeysAvailable:v19];

  if (v18)
  {
    id v20 = [(WFCNContact *)self contact];
    int64_t v13 = [v20 emailAddresses];

    if ([v13 count])
    {
      v21 = [v13 firstObject];
      uint64_t v15 = [v21 value];

LABEL_9:
      goto LABEL_10;
    }
  }
  uint64_t v22 = self->_contact;
  uint64_t v29 = v5;
  uint64_t v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  LODWORD(v22) = [(CNContact *)v22 areKeysAvailable:v23];

  if (v22)
  {
    uint64_t v24 = [(WFCNContact *)self contact];
    int64_t v13 = [v24 phoneNumbers];

    if ([v13 count])
    {
      uint64_t v25 = [v13 firstObject];
      id v26 = [v25 value];
      uint64_t v27 = [v26 stringValue];
      id v28 = +[WFPhoneNumber phoneNumberWithPhoneNumberString:v27];

      uint64_t v15 = [v28 formattedPhoneNumber];

      goto LABEL_9;
    }
  }
  uint64_t v15 = WFLocalizedString(@"No Name");
LABEL_10:

  return v15;
}

- (NSString)contactIdentifier
{
  if ([(WFCNContact *)self fromVCard])
  {
    uint64_t v3 = self->_contactIdentifier;
  }
  else
  {
    id v4 = [(WFCNContact *)self contact];
    uint64_t v3 = [v4 identifier];
  }
  return v3;
}

- (id)vCardRepresentationWithFullData:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v5 = [getCNContactVCardSerializationClass() descriptorForRequiredKeys];
  long long v33 = v5;
  BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v33 count:1];

  if (WFCNContactAuthorizationStatus() == 3 && ![(CNContact *)self->_contact areKeysAvailable:v6])
  {
    contact = self->_contact;
    uint64_t v28 = 0;
    uint64_t v29 = &v28;
    uint64_t v30 = 0x2020000000;
    uint64_t v8 = (void *)getCNContactIdentifierKeySymbolLoc_ptr;
    uint64_t v31 = getCNContactIdentifierKeySymbolLoc_ptr;
    if (!getCNContactIdentifierKeySymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getCNContactIdentifierKeySymbolLoc_block_invoke;
      long long v35 = &unk_26428AC60;
      __int16 v36 = &v28;
      unint64_t v9 = ContactsLibrary_11241();
      uint64_t v10 = dlsym(v9, "CNContactIdentifierKey");
      *(void *)(v36[1] + 24) = v10;
      getCNContactIdentifierKeySymbolLoc_ptr = *(void *)(v36[1] + 24);
      uint64_t v8 = (void *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (!v8)
    {
      id v26 = [MEMORY[0x263F08690] currentHandler];
      uint64_t v27 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactIdentifierKey(void)"];
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"WFCNContact.m", 48, @"%s", dlerror());

      __break(1u);
    }
    if ([(CNContact *)contact isKeyAvailable:*v8])
    {
      uint64_t v11 = getWFWFContactLogObject();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v12 = self->_contact;
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "-[WFCNContact vCardRepresentationWithFullData:]";
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v12;
        _os_log_impl(&dword_216505000, v11, OS_LOG_TYPE_DEFAULT, "%s Insufficient information available for serializing %@, re-fetching", buf, 0x16u);
      }

      [(WFCNContact *)self refetchContact];
    }
  }
  int64_t v13 = self->_contact;
  if (![(CNContact *)v13 areKeysAvailable:v6])
  {
    id v14 = getWFWFContactLogObject();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&uint8_t buf[4] = "-[WFCNContact vCardRepresentationWithFullData:]";
      _os_log_impl(&dword_216505000, v14, OS_LOG_TYPE_DEFAULT, "%s Keys required for serialization still not available, a new copy generated", buf, 0xCu);
    }

    uint64_t v15 = [(CNContact *)self->_contact copyWithDistinctIdentifier];
    int64_t v13 = (CNContact *)v15;
  }
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2050000000;
  int64_t v16 = (void *)getCNVCardWritingOptionsClass_softClass;
  uint64_t v31 = getCNVCardWritingOptionsClass_softClass;
  if (!getCNVCardWritingOptionsClass_softClass)
  {
    *(void *)buf = MEMORY[0x263EF8330];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getCNVCardWritingOptionsClass_block_invoke;
    long long v35 = &unk_26428AC60;
    __int16 v36 = &v28;
    __getCNVCardWritingOptionsClass_block_invoke((uint64_t)buf);
    int64_t v16 = (void *)v29[3];
  }
  id v17 = v16;
  _Block_object_dispose(&v28, 8);
  uint64_t v18 = [v17 optionsFromPreferences];
  [v18 setShouldSuppressRegulatoryLogging:1];
  if (v3)
  {
    [v18 setIncludeNotes:1];
    [v18 setIncludePhotos:1];
    [v18 setIncludePrivateFields:1];
    [v18 setPrefersUncroppedPhotos:1];
  }
  id CNContactVCardSerializationClass = getCNContactVCardSerializationClass();
  long long v32 = v13;
  id v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v32 count:1];
  v21 = [CNContactVCardSerializationClass dataWithContacts:v20 options:v18 error:0];

  if (v21)
  {
    uint64_t v22 = [MEMORY[0x263F852B8] typeWithUTType:*MEMORY[0x263F1DD50]];
    uint64_t v23 = [(WFContact *)self wfName];
    uint64_t v24 = +[WFFileRepresentation fileWithData:v21 ofType:v22 proposedFilename:v23];
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

- (id)contactIdentifierForINPerson
{
  v39[1] = *MEMORY[0x263EF8340];
  id v3 = [(WFCNContact *)self contactIdentifier];
  getCNContactStoreClass();
  id v4 = objc_opt_new();
  if (v3)
  {
    id CNContactClass = getCNContactClass();
    v39[0] = v3;
    BOOL v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:1];
    id v7 = [CNContactClass predicateForContactsWithIdentifiers:v6];

    uint64_t v8 = [v4 unifiedContactsMatchingPredicate:v7 keysToFetch:MEMORY[0x263EFFA68] error:0];
    BOOL v9 = [v8 count] == 0;

    if (!v9) {
      goto LABEL_11;
    }
  }
  uint64_t v10 = objc_opt_new();
  uint64_t v11 = [(WFCNContact *)self emailAddresses];
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __43__WFCNContact_contactIdentifierForINPerson__block_invoke;
  v31[3] = &unk_264287F38;
  id v12 = v10;
  id v32 = v12;
  [v11 enumerateObjectsUsingBlock:v31];

  int64_t v13 = [(WFCNContact *)self phoneNumbers];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __43__WFCNContact_contactIdentifierForINPerson__block_invoke_2;
  v29[3] = &unk_264287F38;
  id v7 = v12;
  id v30 = v7;
  [v13 enumerateObjectsUsingBlock:v29];

  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__11379;
  uint64_t v27 = __Block_byref_object_dispose__11380;
  id v28 = 0;
  if ([v7 count])
  {
    id v14 = [getCNContactClass() predicateForContactsMatchingHandleStrings:v7];
    id v15 = objc_alloc((Class)getCNContactFetchRequestClass());
    uint64_t v16 = [(id)objc_opt_class() requiredKeysToFetch];
    id v17 = (void *)[v15 initWithKeysToFetch:v16];

    [v17 setPredicate:v14];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __43__WFCNContact_contactIdentifierForINPerson__block_invoke_104;
    v21[3] = &unk_264287F60;
    v21[5] = &v23;
    id v22 = 0;
    v21[4] = self;
    LOBYTE(v16) = [v4 enumerateContactsWithFetchRequest:v17 error:&v22 usingBlock:v21];
    id v18 = v22;
    if ((v16 & 1) == 0)
    {
      uint64_t v19 = getWFWFContactLogObject();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        __int16 v34 = "-[WFCNContact contactIdentifierForINPerson]";
        __int16 v35 = 2112;
        id v36 = v7;
        __int16 v37 = 2114;
        id v38 = v18;
        _os_log_impl(&dword_216505000, v19, OS_LOG_TYPE_ERROR, "%s Failed to enumerate contacts when fetching contact identifier for handleStrings %@: %{public}@", buf, 0x20u);
      }
    }
  }
  id v3 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

LABEL_11:
  return v3;
}

void __43__WFCNContact_contactIdentifierForINPerson__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 value];
  id v3 = [v4 address];
  [v2 addObject:v3];
}

void __43__WFCNContact_contactIdentifierForINPerson__block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v4 = [a2 value];
  id v3 = [v4 normalizedPhoneNumber];
  [v2 addObject:v3];
}

void __43__WFCNContact_contactIdentifierForINPerson__block_invoke_104(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 identifier];
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  BOOL v9 = [*(id *)(a1 + 32) contact];
  int v10 = [v9 isEqualIgnoringIdentifiers:v5];

  if (v10) {
    *a3 = 1;
  }
}

- (WFCNContact)contactWithPropertyID:(int)a3 multivalueIndex:(int64_t)a4
{
  uint64_t v5 = *(void *)&a3;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = [(WFCNContact *)self contact];
  BOOL v9 = [v7 contactWithCNContact:v8 propertyID:v5 multivalueIndex:a4];

  return (WFCNContact *)v9;
}

- (id)valueForPropertyID:(int)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = CNContactPropertyKeyFromWFContactPropertyID(a3);
  if (v4)
  {
    if ([(CNContact *)self->_contact isKeyAvailable:v4]) {
      goto LABEL_6;
    }
    uint64_t v5 = getWFWFContactLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      contact = self->_contact;
      int v10 = 136315650;
      uint64_t v11 = "-[WFCNContact valueForPropertyID:]";
      __int16 v12 = 2112;
      int64_t v13 = v4;
      __int16 v14 = 2112;
      id v15 = contact;
      _os_log_impl(&dword_216505000, v5, OS_LOG_TYPE_DEFAULT, "%s Required key %@ is not available for contact %@, re-fetching", (uint8_t *)&v10, 0x20u);
    }

    [(WFCNContact *)self refetchContact];
    if ([(CNContact *)self->_contact isKeyAvailable:v4])
    {
LABEL_6:
      uint64_t v7 = [(CNContact *)self->_contact valueForKey:v4];
      goto LABEL_11;
    }
    uint64_t v8 = getWFWFContactLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[WFCNContact valueForPropertyID:]";
      __int16 v12 = 2112;
      int64_t v13 = v4;
      _os_log_impl(&dword_216505000, v8, OS_LOG_TYPE_ERROR, "%s Required key %@ still not available, bailing", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = 0;
LABEL_11:

  return v7;
}

- (void)refetchContact
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (WFCNContactAuthorizationStatus() == 3)
  {
    getCNContactStoreClass();
    id v3 = objc_opt_new();
    id v4 = [(CNContact *)self->_contact identifier];
    uint64_t v5 = [(id)objc_opt_class() requiredKeysToFetch];
    id v10 = 0;
    uint64_t v6 = [v3 unifiedContactWithIdentifier:v4 keysToFetch:v5 error:&v10];
    id v7 = v10;

    if (v6)
    {
      uint64_t v8 = v6;
      p_super = &self->_contact->super;
      self->_contact = v8;
    }
    else
    {
      p_super = getWFWFContactLogObject();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v12 = "-[WFCNContact refetchContact]";
        __int16 v13 = 2112;
        id v14 = v7;
        _os_log_impl(&dword_216505000, p_super, OS_LOG_TYPE_ERROR, "%s Failed to re-fetch contact with error %@", buf, 0x16u);
      }
    }
  }
}

- (WFCNContact)initWithCNContact:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5 fromVCard:(BOOL)a6
{
  id v11 = a3;
  if (!v11)
  {
    id v17 = [MEMORY[0x263F08690] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"WFCNContact.m", 294, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v18.receiver = self;
  v18.super_class = (Class)WFCNContact;
  __int16 v12 = [(WFCNContact *)&v18 init];
  if (v12)
  {
    uint64_t v13 = [v11 copy];
    contact = v12->_contact;
    v12->_contact = (CNContact *)v13;

    v12->_propertyID = a4;
    v12->_multivalueIndex = a5;
    v12->_fromVCard = a6;
    uint64_t v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (void)removeContactsChangeObserver:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    os_unfair_lock_lock(&WFChangeObserversLock);
    uint64_t v5 = objc_msgSend(a1, "lock_changeObservers");
    [v5 removeObjectForKey:v4];

    objc_msgSend(a1, "lock_updateContactStoreObservation");
    os_unfair_lock_unlock(&WFChangeObserversLock);
  }
}

+ (id)addContactsChangeObserver:(id)a3
{
  id v4 = (void *)MEMORY[0x263F08C38];
  id v5 = a3;
  uint64_t v6 = [v4 UUID];
  os_unfair_lock_lock(&WFChangeObserversLock);
  id v7 = objc_msgSend(a1, "lock_changeObservers");
  uint64_t v8 = _Block_copy(v5);

  [v7 setObject:v8 forKey:v6];
  objc_msgSend(a1, "lock_updateContactStoreObservation");
  os_unfair_lock_unlock(&WFChangeObserversLock);
  return v6;
}

+ (void)contactStoreDidChange:(id)a3
{
  os_unfair_lock_lock(&WFChangeObserversLock);
  id v4 = objc_msgSend(a1, "lock_changeObservers");
  id v5 = (id)[v4 copy];

  os_unfair_lock_unlock(&WFChangeObserversLock);
  [v5 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_137];
}

uint64_t __37__WFCNContact_contactStoreDidChange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t))(a3 + 16))(a3);
}

+ (void)lock_updateContactStoreObservation
{
  id v3 = objc_msgSend(a1, "lock_changeObservers");
  uint64_t v4 = [v3 count];

  int v5 = lock_updateContactStoreObservation_observingChanges;
  if (v4) {
    char v6 = lock_updateContactStoreObservation_observingChanges;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = getCNContactStoreDidChangeNotification();
    [v7 addObserver:a1 selector:sel_contactStoreDidChange_ name:v8 object:0];
    goto LABEL_10;
  }
  if (v4) {
    int v5 = 0;
  }
  if (v5 == 1)
  {
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v8 = getCNContactStoreDidChangeNotification();
    [v7 removeObserver:a1 name:v8 object:0];
LABEL_10:

    lock_updateContactStoreObservation_observingChanges = v6 ^ 1;
  }
}

+ (id)lock_changeObservers
{
  if (lock_changeObservers_onceToken != -1) {
    dispatch_once(&lock_changeObservers_onceToken, &__block_literal_global_130_11410);
  }
  v2 = (void *)lock_changeObservers_changeObservers;
  return v2;
}

uint64_t __35__WFCNContact_lock_changeObservers__block_invoke()
{
  lock_changeObservers_changeObservers = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

+ (id)contactWithCNContact:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  BOOL v9 = (void *)[objc_alloc((Class)a1) initWithCNContact:v8 propertyID:v6 multivalueIndex:a5 fromVCard:0];

  return v9;
}

+ (id)contactWithCNContact:(id)a3
{
  return (id)[a1 contactWithCNContact:a3 propertyID:0xFFFFFFFFLL multivalueIndex:-1];
}

+ (id)contactWithVCardData:(id)a3 propertyID:(int)a4 multivalueIndex:(int64_t)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = *(void *)&a4;
    id v8 = a3;
    id v16 = 0;
    BOOL v9 = [getCNContactVCardSerializationClass() contactsWithData:v8 error:&v16];

    id v10 = v16;
    id v11 = [v9 firstObject];

    if (v11)
    {
      id v12 = objc_alloc((Class)a1);
      uint64_t v13 = [v9 firstObject];
      id v14 = (void *)[v12 initWithCNContact:v13 propertyID:v6 multivalueIndex:a5 fromVCard:1];
    }
    else
    {
      uint64_t v13 = getWFWFContactLogObject();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        objc_super v18 = "+[WFCNContact contactWithVCardData:propertyID:multivalueIndex:]";
        __int16 v19 = 2114;
        id v20 = v10;
        _os_log_impl(&dword_216505000, v13, OS_LOG_TYPE_ERROR, "%s Contact failed to deserialize from vCard data: %{public}@", buf, 0x16u);
      }
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }
  return v14;
}

+ (id)contactsWithVCardData:(id)a3
{
  id v4 = a3;
  int v5 = [getCNContactVCardSerializationClass() contactsWithData:v4 error:0];

  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __37__WFCNContact_contactsWithVCardData___block_invoke;
  v8[3] = &__block_descriptor_40_e22__24__0__CNContact_8Q16l;
  v8[4] = a1;
  uint64_t v6 = objc_msgSend(v5, "if_map:", v8);

  return v6;
}

id __37__WFCNContact_contactsWithVCardData___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(objc_class **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)[[v2 alloc] initWithCNContact:v3 propertyID:0xFFFFFFFFLL multivalueIndex:-1 fromVCard:1];

  return v4;
}

+ (id)requiredKeysToFetch
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v38 = [getCNContactVCardSerializationClass() descriptorForRequiredKeys];
  v43[0] = v38;
  v2 = [getCNContactFormatterClass() descriptorForRequiredKeysForStyle:0];
  v43[1] = v2;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  id v3 = (id *)getCNContactImageDataAvailableKeySymbolLoc_ptr;
  uint64_t v42 = getCNContactImageDataAvailableKeySymbolLoc_ptr;
  if (!getCNContactImageDataAvailableKeySymbolLoc_ptr)
  {
    id v4 = ContactsLibrary_11241();
    v40[3] = (uint64_t)dlsym(v4, "CNContactImageDataAvailableKey");
    getCNContactImageDataAvailableKeySymbolLoc_ptr = v40[3];
    id v3 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v3)
  {
    id v26 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v27 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactImageDataAvailableKey(void)"];
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, @"WFCNContact.m", 43, @"%s", dlerror());

    goto LABEL_28;
  }
  id v5 = *v3;
  v43[2] = v5;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v6 = (id *)getCNContactImageDataKeySymbolLoc_ptr;
  uint64_t v42 = getCNContactImageDataKeySymbolLoc_ptr;
  if (!getCNContactImageDataKeySymbolLoc_ptr)
  {
    id v7 = ContactsLibrary_11241();
    v40[3] = (uint64_t)dlsym(v7, "CNContactImageDataKey");
    getCNContactImageDataKeySymbolLoc_ptr = v40[3];
    uint64_t v6 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v6)
  {
    id v28 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v29 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactImageDataKey(void)"];
    objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, @"WFCNContact.m", 44, @"%s", dlerror());

    goto LABEL_28;
  }
  id v8 = *v6;
  v43[3] = v8;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  BOOL v9 = (id *)getCNContactThumbnailImageDataKeySymbolLoc_ptr;
  uint64_t v42 = getCNContactThumbnailImageDataKeySymbolLoc_ptr;
  if (!getCNContactThumbnailImageDataKeySymbolLoc_ptr)
  {
    id v10 = ContactsLibrary_11241();
    v40[3] = (uint64_t)dlsym(v10, "CNContactThumbnailImageDataKey");
    getCNContactThumbnailImageDataKeySymbolLoc_ptr = v40[3];
    BOOL v9 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v9)
  {
    id v30 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v31 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactThumbnailImageDataKey(void)"];
    objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, @"WFCNContact.m", 45, @"%s", dlerror());

    goto LABEL_28;
  }
  id v11 = *v9;
  v43[4] = v11;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  id v12 = (id *)getCNContactModificationDateKeySymbolLoc_ptr_11416;
  uint64_t v42 = getCNContactModificationDateKeySymbolLoc_ptr_11416;
  if (!getCNContactModificationDateKeySymbolLoc_ptr_11416)
  {
    uint64_t v13 = ContactsLibrary_11241();
    v40[3] = (uint64_t)dlsym(v13, "CNContactModificationDateKey");
    getCNContactModificationDateKeySymbolLoc_ptr_11416 = v40[3];
    id v12 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v12)
  {
    id v32 = [MEMORY[0x263F08690] currentHandler];
    long long v33 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactModificationDateKey(void)"];
    objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, @"WFCNContact.m", 46, @"%s", dlerror());

    goto LABEL_28;
  }
  id v14 = *v12;
  v43[5] = v14;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v15 = (id *)getCNContactCreationDateKeySymbolLoc_ptr_11420;
  uint64_t v42 = getCNContactCreationDateKeySymbolLoc_ptr_11420;
  if (!getCNContactCreationDateKeySymbolLoc_ptr_11420)
  {
    id v16 = ContactsLibrary_11241();
    v40[3] = (uint64_t)dlsym(v16, "CNContactCreationDateKey");
    getCNContactCreationDateKeySymbolLoc_ptr_11420 = v40[3];
    uint64_t v15 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v15)
  {
    __int16 v34 = [MEMORY[0x263F08690] currentHandler];
    __int16 v35 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactCreationDateKey(void)"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"WFCNContact.m", 47, @"%s", dlerror());

    goto LABEL_28;
  }
  id v17 = *v15;
  v43[6] = v17;
  objc_super v18 = getCNContactPhoneNumbersKey();
  v43[7] = v18;
  __int16 v19 = getCNContactEmailAddressesKey();
  v43[8] = v19;
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  id v20 = (id *)getCNContactNicknameKeySymbolLoc_ptr_11424;
  uint64_t v42 = getCNContactNicknameKeySymbolLoc_ptr_11424;
  if (!getCNContactNicknameKeySymbolLoc_ptr_11424)
  {
    uint64_t v21 = ContactsLibrary_11241();
    v40[3] = (uint64_t)dlsym(v21, "CNContactNicknameKey");
    getCNContactNicknameKeySymbolLoc_ptr_11424 = v40[3];
    id v20 = (id *)v40[3];
  }
  _Block_object_dispose(&v39, 8);
  if (!v20)
  {
    id v36 = [MEMORY[0x263F08690] currentHandler];
    __int16 v37 = [NSString stringWithUTF8String:"NSString * _Nonnull getCNContactNicknameKey(void)"];
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"WFCNContact.m", 52, @"%s", dlerror());

LABEL_28:
    __break(1u);
  }
  id v44 = *v20;
  id v22 = (void *)MEMORY[0x263EFF8C0];
  id v23 = v44;
  uint64_t v24 = [v22 arrayWithObjects:v43 count:10];

  return v24;
}

@end