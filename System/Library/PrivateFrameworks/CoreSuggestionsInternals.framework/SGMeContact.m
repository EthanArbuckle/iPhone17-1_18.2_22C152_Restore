@interface SGMeContact
+ (id)keysToFetch;
- (BOOL)isSameAsOrUnifiedWithContact:(id)a3;
- (NSSet)emailAddresses;
- (NSSet)phoneNumbers;
- (NSSet)postalAddresses;
- (NSSet)socialProfileIdentifiers;
- (NSString)familyName;
- (NSString)formattedName;
- (NSString)givenName;
- (SGMeContact)initWithContact:(id)a3;
@end

@implementation SGMeContact

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialProfileIdentifiers, 0);
  objc_storeStrong((id *)&self->_postalAddresses, 0);
  objc_storeStrong((id *)&self->_phoneNumbers, 0);
  objc_storeStrong((id *)&self->_emailAddresses, 0);
  objc_storeStrong((id *)&self->_formattedName, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
}

- (NSSet)socialProfileIdentifiers
{
  return self->_socialProfileIdentifiers;
}

- (NSSet)postalAddresses
{
  return self->_postalAddresses;
}

- (NSSet)phoneNumbers
{
  return self->_phoneNumbers;
}

- (NSSet)emailAddresses
{
  return self->_emailAddresses;
}

- (NSString)formattedName
{
  return self->_formattedName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (BOOL)isSameAsOrUnifiedWithContact:(id)a3
{
  id v4 = a3;
  v5 = [(CNContact *)self->_meContact identifier];
  v6 = [v4 identifier];
  if ([v5 isEqualToString:v6])
  {
    char v7 = 1;
  }
  else
  {
    meContact = self->_meContact;
    v9 = [v4 identifier];
    char v7 = [(CNContact *)meContact isUnifiedWithContactWithIdentifier:v9];
  }
  return v7;
}

- (SGMeContact)initWithContact:(id)a3
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v88.receiver = self;
  v88.super_class = (Class)SGMeContact;
  v6 = [(SGMeContact *)&v88 init];
  if (v6)
  {
    uint64_t v7 = [v5 givenName];
    givenName = v6->_givenName;
    v6->_givenName = (NSString *)v7;

    uint64_t v9 = [v5 familyName];
    familyName = v6->_familyName;
    v6->_familyName = (NSString *)v9;

    v11 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
    v12 = v11;
    id v61 = a3;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      v13 = [v5 givenName];
    }
    formattedName = v6->_formattedName;
    v6->_formattedName = v13;

    v66 = (NSSet *)objc_opt_new();
    v67 = (NSSet *)objc_opt_new();
    uint64_t v15 = objc_opt_new();
    v16 = (NSSet *)objc_opt_new();
    long long v84 = 0u;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    v17 = [v5 emailAddresses];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v84 objects:v93 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v85 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v84 + 1) + 8 * i) value];
          v23 = SGNormalizeEmailAddress();
          [(NSSet *)v66 addObject:v23];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v84 objects:v93 count:16];
      }
      while (v19);
    }
    v64 = (NSSet *)v15;

    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v24 = [v5 phoneNumbers];
    uint64_t v25 = [v24 countByEnumeratingWithState:&v80 objects:v92 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v81 != v27) {
            objc_enumerationMutation(v24);
          }
          v29 = [*(id *)(*((void *)&v80 + 1) + 8 * j) value];
          v30 = [v29 stringValue];
          v31 = SGNormalizePhoneNumber();
          [(NSSet *)v67 addObject:v31];
        }
        uint64_t v26 = [v24 countByEnumeratingWithState:&v80 objects:v92 count:16];
      }
      while (v26);
    }

    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    v32 = [v5 postalAddresses];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v76 objects:v91 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v34; ++k)
        {
          if (*(void *)v77 != v35) {
            objc_enumerationMutation(v32);
          }
          v37 = [*(id *)(*((void *)&v76 + 1) + 8 * k) value];
          v38 = SGNormalizeCNAddress(v37);
          [(NSSet *)v64 addObject:v38];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v76 objects:v91 count:16];
      }
      while (v34);
    }
    v62 = v6;

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    id v63 = v5;
    obuint64_t j = [v5 socialProfiles];
    uint64_t v39 = [obj countByEnumeratingWithState:&v72 objects:v90 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v73;
      do
      {
        for (uint64_t m = 0; m != v40; ++m)
        {
          if (*(void *)v73 != v41) {
            objc_enumerationMutation(obj);
          }
          v43 = *(void **)(*((void *)&v72 + 1) + 8 * m);
          v44 = [SGSocialProfileDetails alloc];
          v45 = [v43 value];
          v46 = [(SGSocialProfileDetails *)v44 initWithCNSocialProfile:v45];

          long long v70 = 0u;
          long long v71 = 0u;
          long long v68 = 0u;
          long long v69 = 0u;
          v47 = [(SGSocialProfileDetails *)v46 uniqueIdentifiers];
          uint64_t v48 = [v47 countByEnumeratingWithState:&v68 objects:v89 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v69;
            do
            {
              for (uint64_t n = 0; n != v49; ++n)
              {
                if (*(void *)v69 != v50) {
                  objc_enumerationMutation(v47);
                }
                [(NSSet *)v16 addObject:*(void *)(*((void *)&v68 + 1) + 8 * n)];
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v68 objects:v89 count:16];
            }
            while (v49);
          }
        }
        uint64_t v40 = [obj countByEnumeratingWithState:&v72 objects:v90 count:16];
      }
      while (v40);
    }

    v6 = v62;
    emailAddresses = v62->_emailAddresses;
    v62->_emailAddresses = v66;
    v53 = v66;

    phoneNumbers = v62->_phoneNumbers;
    v62->_phoneNumbers = v67;
    v55 = v67;

    postalAddresses = v62->_postalAddresses;
    v62->_postalAddresses = v64;
    v57 = v64;

    socialProfileIdentifiers = v62->_socialProfileIdentifiers;
    v62->_socialProfileIdentifiers = v16;
    v59 = v16;

    objc_storeStrong((id *)&v62->_meContact, v61);
    id v5 = v63;
  }

  return v6;
}

+ (id)keysToFetch
{
  v8[7] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v3 = *MEMORY[0x1E4F1ADF0];
  v8[0] = v2;
  v8[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1ADC8];
  v8[2] = *MEMORY[0x1E4F1ADE0];
  v8[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AF10];
  v8[4] = *MEMORY[0x1E4F1AEE0];
  v8[5] = v5;
  v8[6] = *MEMORY[0x1E4F1AF78];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];

  return v6;
}

@end