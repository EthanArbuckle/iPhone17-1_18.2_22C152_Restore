@interface CNContact(EmailContactAdditions)
+ (id)em_bestMatchForName:()EmailContactAdditions fromContacts:keysToCheck:;
+ (id)em_contactFromEmailAddress:()EmailContactAdditions;
+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions;
+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions emailAddress:emailAddressLabel:;
+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions emailAddress:emailAddressLabel:allowInvalidEmailAddress:;
@end

@implementation CNContact(EmailContactAdditions)

+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions emailAddress:emailAddressLabel:allowInvalidEmailAddress:
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_alloc_init(MEMORY[0x1E4F1BA40]);
  v13 = [v9 namePrefix];

  if (v13)
  {
    v14 = [v9 namePrefix];
    [v12 setNamePrefix:v14];
  }
  v15 = [v9 givenName];

  if (v15)
  {
    v16 = [v9 givenName];
    [v12 setGivenName:v16];
  }
  v17 = [v9 middleName];

  if (v17)
  {
    v18 = [v9 middleName];
    [v12 setMiddleName:v18];
  }
  v19 = [v9 familyName];

  if (v19)
  {
    v20 = [v9 familyName];
    [v12 setFamilyName:v20];
  }
  v21 = [v9 nameSuffix];

  if (v21)
  {
    v22 = [v9 nameSuffix];
    [v12 setNameSuffix:v22];
  }
  v23 = [v9 phoneticRepresentation];
  v24 = [v23 givenName];

  if (v24)
  {
    v25 = [v23 givenName];
    [v12 setPhoneticGivenName:v25];
  }
  v26 = [v23 middleName];

  if (v26)
  {
    v27 = [v23 middleName];
    [v12 setPhoneticMiddleName:v27];
  }
  v28 = [v23 familyName];

  if (v28)
  {
    v29 = [v23 familyName];
    [v12 setPhoneticFamilyName:v29];
  }
  if (v10 && (objc_msgSend(v10, "ea_isLegalEmailAddress") | a6) == 1)
  {
    if (v11) {
      id v30 = v11;
    }
    else {
      id v30 = (id)*MEMORY[0x1E4F1B700];
    }
    v31 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:v30 value:v10];
    v34[0] = v31;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [v12 setEmailAddresses:v32];
  }
  return v12;
}

+ (id)em_contactFromEmailAddress:()EmailContactAdditions
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ea_addressCommentPersonNameComponents");
  v6 = objc_msgSend(v4, "ea_uncommentedAddress");
  v7 = objc_msgSend(a1, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:", v5, v6, 0);

  return v7;
}

+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions
{
  v3 = objc_msgSend(a1, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:", a3, 0, 0);
  return v3;
}

+ (id)em_contactWithPersonNameComponents:()EmailContactAdditions emailAddress:emailAddressLabel:
{
  v5 = objc_msgSend(a1, "em_contactWithPersonNameComponents:emailAddress:emailAddressLabel:allowInvalidEmailAddress:", a3, a4, a5, 0);
  return v5;
}

+ (id)em_bestMatchForName:()EmailContactAdditions fromContacts:keysToCheck:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v7 = a4;
  id v29 = a5;
  id v30 = v7;
  if ((unint64_t)[v7 count] > 1)
  {
    int v32 = [v29 containsObject:*MEMORY[0x1E4F1ADF0]];
    int v9 = [v29 containsObject:*MEMORY[0x1E4F1ADE0]];
    if ((v32 | v9) == 1)
    {
      v26 = [MEMORY[0x1E4F5A470] componentsFromString:v28];
      uint64_t v31 = [v26 givenName];
      uint64_t v10 = [v26 familyName];
      if (v31 | v10)
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = v7;
        uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v11)
        {
          id v33 = 0;
          id v34 = 0;
          uint64_t v12 = *(void *)v36;
LABEL_7:
          uint64_t v13 = 0;
          while (1)
          {
            if (*(void *)v36 != v12) {
              objc_enumerationMutation(obj);
            }
            v14 = *(void **)(*((void *)&v35 + 1) + 8 * v13);
            if (v32)
            {
              v15 = [*(id *)(*((void *)&v35 + 1) + 8 * v13) givenName];
              if (!v9) {
                goto LABEL_12;
              }
            }
            else
            {
              v15 = 0;
              if (!v9)
              {
LABEL_12:
                v16 = 0;
                goto LABEL_15;
              }
            }
            v16 = [v14 familyName];
LABEL_15:
            int v17 = [v15 isEqualToString:v31];
            uint64_t v18 = v10;
            int v19 = [v16 isEqualToString:v10];
            if (v17 & v19)
            {
              id v22 = v14;

              uint64_t v10 = v18;
              v23 = v33;
              if (v22) {
                goto LABEL_37;
              }
              goto LABEL_34;
            }
            if (v33) {
              int v20 = 0;
            }
            else {
              int v20 = v17;
            }
            if (v20 == 1) {
              id v33 = v14;
            }
            if (v34) {
              int v21 = 0;
            }
            else {
              int v21 = v19;
            }
            if (v21 == 1) {
              id v34 = v14;
            }

            uint64_t v10 = v18;
            if (v11 == ++v13)
            {
              uint64_t v11 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
              if (v11) {
                goto LABEL_7;
              }
              goto LABEL_33;
            }
          }
        }
        id v33 = 0;
        id v34 = 0;
LABEL_33:

LABEL_34:
        v24 = v34;
        if (v34 || (v34 = 0, v23 = 0, id v22 = 0, (v24 = v33) != 0))
        {
          id v22 = v24;
          v23 = v33;
        }
LABEL_37:
      }
      else
      {
        id v22 = 0;
      }

      if (v22) {
        goto LABEL_41;
      }
    }
    uint64_t v8 = [v30 firstObject];
    goto LABEL_40;
  }
  uint64_t v8 = [v7 firstObject];
LABEL_40:
  id v22 = (id)v8;
LABEL_41:

  return v22;
}

@end