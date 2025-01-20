@interface CNContact
- (BOOL)canExceedUnifyingThreshold;
- (BOOL)isBlocked;
- (id)labeledValueForEmailAddress:(id)a3;
- (id)labeledValueForPhoneNumber:(id)a3;
- (id)labeledValueForSocialProfileWithUsername:(id)a3;
- (id)labeledValueForTelephoneNumber:(id)a3;
- (void)block;
- (void)unblock;
@end

@implementation CNContact

- (BOOL)canExceedUnifyingThreshold
{
  v3 = [(CNContact *)self phoneNumbers];
  if ((unint64_t)[v3 count] > 0x14)
  {
    BOOL v5 = 1;
  }
  else
  {
    v4 = [(CNContact *)self emailAddresses];
    if ((unint64_t)[v4 count] <= 0x14)
    {
      v6 = [(CNContact *)self postalAddresses];
      if ((unint64_t)[v6 count] <= 0x14)
      {
        v7 = [(CNContact *)self urlAddresses];
        if ((unint64_t)[v7 count] <= 0x14)
        {
          v8 = [(CNContact *)self contactRelations];
          if ((unint64_t)[v8 count] <= 0x14)
          {
            v9 = [(CNContact *)self socialProfiles];
            if ((unint64_t)[v9 count] <= 0x14)
            {
              v10 = [(CNContact *)self instantMessageAddresses];
              BOOL v5 = (unint64_t)[v10 count] > 0x14;
            }
            else
            {
              BOOL v5 = 1;
            }
          }
          else
          {
            BOOL v5 = 1;
          }
        }
        else
        {
          BOOL v5 = 1;
        }
      }
      else
      {
        BOOL v5 = 1;
      }
    }
    else
    {
      BOOL v5 = 1;
    }
  }
  return v5;
}

- (id)labeledValueForEmailAddress:(id)a3
{
  id v4 = a3;
  if ([(CNContact *)self isKeyAvailable:CNContactEmailAddressesKey])
  {
    [(CNContact *)self emailAddresses];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isSuggested", (void)v13) & 1) == 0)
          {
            v10 = [v9 value];
            unsigned int v11 = [v10 isEqualToString:v4];

            if (v11)
            {
              id v6 = v9;
              goto LABEL_14;
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)labeledValueForPhoneNumber:(id)a3
{
  id v4 = a3;
  if ([(CNContact *)self isKeyAvailable:CNContactPhoneNumbersKey])
  {
    [(CNContact *)self phoneNumbers];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          if ((objc_msgSend(v9, "isSuggested", (void)v13) & 1) == 0)
          {
            v10 = [v9 value];
            unsigned int v11 = [v10 isLikePhoneNumber:v4];

            if (v11)
            {
              id v6 = v9;
              goto LABEL_14;
            }
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)labeledValueForSocialProfileWithUsername:(id)a3
{
  id v4 = a3;
  if ([(CNContact *)self isKeyAvailable:CNContactSocialProfilesKey])
  {
    [(CNContact *)self socialProfiles];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v5);
          }
          v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          v10 = [v9 value:v14];
          unsigned int v11 = [v10 username];
          unsigned int v12 = [v11 isEqualToString:v4];

          if (v12)
          {
            id v6 = v9;

            goto LABEL_13;
          }
        }
        id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)labeledValueForTelephoneNumber:(id)a3
{
  id v4 = a3;
  id v5 = +[CNPhoneNumber phoneNumberWithStringValue:v4];
  if (v5)
  {
    id v6 = [(CNContact *)self labeledValueForPhoneNumber:v5];
  }
  else
  {
    uint64_t v7 = PHDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[CNContact(PhoneKit) labeledValueForTelephoneNumber:]((uint64_t)v4, v7);
    }

    id v6 = 0;
  }

  return v6;
}

- (void)unblock
{
  v2 = self;
  CNContact.unblock()();
}

- (void)block
{
  v2 = self;
  CNContact.block()();
}

- (BOOL)isBlocked
{
  v2 = self;
  Swift::Bool v3 = CNContact.isBlocked()();

  return v3;
}

@end