@interface EKParticipantToContactMatcher
+ (id)_allParticipantsOnItem:(id)a3;
+ (id)_nameComponentsForContact:(id)a3 reverse:(BOOL)a4;
+ (id)_nameComponentsWithGivenName:(id)a3 familyName:(id)a4;
- (BOOL)anyContactMatchesAnyParticipant:(id)a3;
- (BOOL)anyContactMatchesAnyParticipantFromItem:(id)a3;
- (BOOL)anyContactMatchesParticipant:(id)a3;
- (EKParticipantToContactMatcher)initWithContacts:(id)a3;
- (NSArray)contacts;
- (NSSet)contactCompanyNames;
- (NSSet)contactEmailAddresses;
- (NSSet)contactNameComponents;
- (id)matchingParticipantsFromItem:(id)a3;
- (id)matchingParticipantsFromParticipants:(id)a3;
- (void)_cacheContactData;
- (void)setContactCompanyNames:(id)a3;
- (void)setContactEmailAddresses:(id)a3;
- (void)setContactNameComponents:(id)a3;
- (void)setContacts:(id)a3;
@end

@implementation EKParticipantToContactMatcher

- (EKParticipantToContactMatcher)initWithContacts:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKParticipantToContactMatcher;
  v6 = [(EKParticipantToContactMatcher *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contacts, a3);
    [(EKParticipantToContactMatcher *)v7 _cacheContactData];
  }

  return v7;
}

- (void)_cacheContactData
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA80] set];
  v27 = [MEMORY[0x1E4F1CA80] set];
  v26 = [MEMORY[0x1E4F1CA80] set];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  v32 = self;
  id obj = [(EKParticipantToContactMatcher *)self contacts];
  uint64_t v4 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v40;
    uint64_t v7 = *MEMORY[0x1E4F1ADC8];
    uint64_t v8 = *MEMORY[0x1E4F1ADF0];
    uint64_t v29 = *MEMORY[0x1E4F1ADE0];
    uint64_t v9 = *MEMORY[0x1E4F1AED8];
    uint64_t v30 = *MEMORY[0x1E4F1ADF0];
    uint64_t v31 = *MEMORY[0x1E4F1ADC8];
    uint64_t v28 = *MEMORY[0x1E4F1AED8];
    do
    {
      uint64_t v10 = 0;
      uint64_t v33 = v5;
      do
      {
        if (*(void *)v40 != v6) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v39 + 1) + 8 * v10);
        if ([v11 isKeyAvailable:v7])
        {
          uint64_t v12 = v6;
          v13 = [v11 emailAddresses];
          v14 = [v13 valueForKey:@"value"];
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
          if (v15)
          {
            uint64_t v16 = v15;
            uint64_t v17 = *(void *)v36;
            do
            {
              for (uint64_t i = 0; i != v16; ++i)
              {
                if (*(void *)v36 != v17) {
                  objc_enumerationMutation(v14);
                }
                v19 = [*(id *)(*((void *)&v35 + 1) + 8 * i) lowercaseString];
                [v3 addObject:v19];
              }
              uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v43 count:16];
            }
            while (v16);
          }

          uint64_t v6 = v12;
          uint64_t v8 = v30;
          uint64_t v7 = v31;
          uint64_t v5 = v33;
          uint64_t v9 = v28;
        }
        if ([v11 isKeyAvailable:v8]
          && [v11 isKeyAvailable:v29])
        {
          v20 = [(id)objc_opt_class() _nameComponentsForContact:v11 reverse:0];
          if (v20) {
            [v27 addObject:v20];
          }
          v21 = [(id)objc_opt_class() _nameComponentsForContact:v11 reverse:1];
          if (v21) {
            [v27 addObject:v21];
          }
        }
        if ([v11 isKeyAvailable:v9])
        {
          v22 = [v11 organizationName];
          uint64_t v23 = [v22 length];

          if (v23)
          {
            v24 = [v11 organizationName];
            v25 = [v24 lowercaseString];
            [v26 addObject:v25];
          }
        }
        ++v10;
      }
      while (v10 != v5);
      uint64_t v5 = [obj countByEnumeratingWithState:&v39 objects:v44 count:16];
    }
    while (v5);
  }

  [(EKParticipantToContactMatcher *)v32 setContactEmailAddresses:v3];
  [(EKParticipantToContactMatcher *)v32 setContactNameComponents:v27];
  [(EKParticipantToContactMatcher *)v32 setContactCompanyNames:v26];
}

+ (id)_nameComponentsForContact:(id)a3 reverse:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 familyName];
    [v7 givenName];
  }
  else
  {
    uint64_t v8 = [v6 givenName];
    [v7 familyName];
  uint64_t v9 = };

  uint64_t v10 = [a1 _nameComponentsWithGivenName:v8 familyName:v9];

  return v10;
}

+ (id)_nameComponentsWithGivenName:(id)a3 familyName:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 length] || objc_msgSend(v6, "length"))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28F30]);
    uint64_t v8 = [v5 lowercaseString];
    uint64_t v9 = (void *)v8;
    if (v8) {
      uint64_t v10 = (__CFString *)v8;
    }
    else {
      uint64_t v10 = &stru_1EF932508;
    }
    [v7 setGivenName:v10];

    uint64_t v11 = [v6 lowercaseString];
    uint64_t v12 = (void *)v11;
    if (v11) {
      v13 = (__CFString *)v11;
    }
    else {
      v13 = &stru_1EF932508;
    }
    [v7 setFamilyName:v13];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

+ (id)_allParticipantsOnItem:(id)a3
{
  id v3 = a3;
  BOOL v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = [v3 attendees];
  id v6 = [v4 arrayWithArray:v5];

  id v7 = [v3 organizer];

  if (v7)
  {
    uint64_t v8 = [v3 organizer];
    [v6 addObject:v8];
  }

  return v6;
}

- (BOOL)anyContactMatchesAnyParticipantFromItem:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _allParticipantsOnItem:v4];

  LOBYTE(self) = [(EKParticipantToContactMatcher *)self anyContactMatchesAnyParticipant:v5];
  return (char)self;
}

- (BOOL)anyContactMatchesAnyParticipant:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        if (-[EKParticipantToContactMatcher anyContactMatchesParticipant:](self, "anyContactMatchesParticipant:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
        {
          BOOL v9 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 0;
LABEL_11:

  return v9;
}

- (id)matchingParticipantsFromItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() _allParticipantsOnItem:v4];

  uint64_t v6 = [(EKParticipantToContactMatcher *)self matchingParticipantsFromParticipants:v5];

  return v6;
}

- (id)matchingParticipantsFromParticipants:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (-[EKParticipantToContactMatcher anyContactMatchesParticipant:](self, "anyContactMatchesParticipant:", v11, (void)v13))
        {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (BOOL)anyContactMatchesParticipant:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!v4) {
    goto LABEL_8;
  }
  id v6 = [v4 emailAddress];
  uint64_t v7 = [v6 lowercaseString];

  uint64_t v8 = [(EKParticipantToContactMatcher *)self contactEmailAddresses];
  int v9 = [v8 containsObject:v7];

  if (!v9)
  {
    uint64_t v10 = [v5 nameComponents];
    uint64_t v11 = objc_opt_class();
    long long v12 = [v10 givenName];
    long long v13 = [v10 familyName];
    long long v14 = [v11 _nameComponentsWithGivenName:v12 familyName:v13];

    long long v15 = [(EKParticipantToContactMatcher *)self contactNameComponents];
    long long v16 = [v15 allObjects];
    char v17 = [v16 containsObject:v14];

    if (v17)
    {

      goto LABEL_5;
    }
    uint64_t v19 = [v5 name];
    v20 = [(id)v19 lowercaseString];

    v21 = [(EKParticipantToContactMatcher *)self contactCompanyNames];
    LOBYTE(v19) = [v21 containsObject:v20];

    if (v19) {
      goto LABEL_6;
    }
LABEL_8:
    BOOL v18 = 0;
    goto LABEL_9;
  }
LABEL_5:

LABEL_6:
  BOOL v18 = 1;
LABEL_9:

  return v18;
}

- (NSArray)contacts
{
  return self->_contacts;
}

- (void)setContacts:(id)a3
{
}

- (NSSet)contactEmailAddresses
{
  return self->_contactEmailAddresses;
}

- (void)setContactEmailAddresses:(id)a3
{
}

- (NSSet)contactNameComponents
{
  return self->_contactNameComponents;
}

- (void)setContactNameComponents:(id)a3
{
}

- (NSSet)contactCompanyNames
{
  return self->_contactCompanyNames;
}

- (void)setContactCompanyNames:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactCompanyNames, 0);
  objc_storeStrong((id *)&self->_contactNameComponents, 0);
  objc_storeStrong((id *)&self->_contactEmailAddresses, 0);

  objc_storeStrong((id *)&self->_contacts, 0);
}

@end