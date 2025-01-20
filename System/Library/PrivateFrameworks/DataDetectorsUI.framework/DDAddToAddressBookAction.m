@interface DDAddToAddressBookAction
+ (BOOL)actionAvailableForContact:(id)a3;
+ (BOOL)isAvailable;
- (id)compactTitle;
- (id)contact;
- (id)localizedName;
- (id)notificationIconBundleIdentifier;
- (id)notificationTitle;
- (id)notificationURL;
- (int)interactionType;
- (void)adaptForPresentationInPopover:(BOOL)a3;
- (void)invalidate;
- (void)prepareViewControllerForActionController:(id)a3;
@end

@implementation DDAddToAddressBookAction

- (void)invalidate
{
  v3 = [(DDAction *)self viewController];
  [v3 setAction:0];

  [(DDAction *)self setViewController:0];
}

- (id)localizedName
{
  return DDLocalizedString(@"Add to Contacts");
}

- (int)interactionType
{
  return 1;
}

+ (BOOL)isAvailable
{
  return +[DDRemoteActionViewController controllerIsAvailable];
}

- (void)prepareViewControllerForActionController:(id)a3
{
  id v3 = +[DDRemoteActionViewController prepareViewController:@"DDAddToContactsViewController" forAction:self actionController:a3];
}

- (void)adaptForPresentationInPopover:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(DDAction *)self viewController];
  [v4 adaptForPresentationInPopover:v3];
}

+ (BOOL)actionAvailableForContact:(id)a3
{
  if (a3) {
    return [a1 isAvailable];
  }
  else {
    return 0;
  }
}

- (id)compactTitle
{
  BOOL v3 = [(DDAddToAddressBookAction *)self contact];
  if (!v3) {
    goto LABEL_7;
  }
  id v4 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  if (![v4 length] && objc_msgSend(v3, "isKeyAvailable:", @"organizationName"))
  {
    uint64_t v5 = [v3 organizationName];

    id v4 = (void *)v5;
  }
  if (![v4 length])
  {

LABEL_7:
    v7.receiver = self;
    v7.super_class = (Class)DDAddToAddressBookAction;
    id v4 = [(DDAction *)&v7 compactTitle];
  }

  return v4;
}

- (id)contact
{
  v19[1] = *MEMORY[0x1E4F143B8];
  p_contact = &self->super.super._contact;
  contact = self->super.super._contact;
  if (!contact)
  {
    uint64_t v5 = self->super.super._url;
    v6 = DDPersonActionsSupportedSchemes();
    if (v5)
    {
      if (self->super.super._result)
      {
        objc_super v7 = 0;
      }
      else
      {
        objc_super v7 = [(NSURL *)v5 dd_phoneNumberFromValidSchemes:v6];
      }
      if (!self->super.super._result)
      {
        v14 = [(NSURL *)v5 dd_emailFromValidSchemes:v6];
        v9 = objc_msgSend(v14, "dd_userFriendlyEmail");

        v8 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
        if (v9)
        {
          uint64_t v15 = [MEMORY[0x1E4F1BA20] labeledValueWithLabel:0 value:v9];
          v16 = (void *)v15;
          if (v15)
          {
            v19[0] = v15;
            v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
            [(CNContact *)v8 setEmailAddresses:v17];
          }
          objc_storeStrong((id *)p_contact, v8);

          if (!v7) {
            goto LABEL_17;
          }
          goto LABEL_11;
        }
LABEL_9:
        if (!v7)
        {
          if (!self->super.super._result)
          {
            v9 = 0;
            objc_super v7 = 0;
            goto LABEL_17;
          }
          DDAugmentContactWithResultsFromAction(v8, self);
          v8 = v8;
          v9 = 0;
          objc_super v7 = 0;
          id v11 = *p_contact;
          *p_contact = v8;
LABEL_16:

LABEL_17:
          contact = *p_contact;
          goto LABEL_18;
        }
        v9 = 0;
LABEL_11:
        uint64_t v10 = DDPhoneLabeledValue(0, v7);
        id v11 = (id)v10;
        if (v10)
        {
          uint64_t v18 = v10;
          v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          [(CNContact *)v8 setPhoneNumbers:v12];
        }
        objc_storeStrong((id *)p_contact, v8);
        goto LABEL_16;
      }
    }
    else
    {
      objc_super v7 = 0;
    }
    v8 = (CNContact *)objc_alloc_init(MEMORY[0x1E4F1BA40]);
    goto LABEL_9;
  }
LABEL_18:
  return contact;
}

- (id)notificationTitle
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(DDAddToAddressBookAction *)self contact];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v5 = [MEMORY[0x1E4F1B910] stringFromContact:self->super.super._contact style:0];
    if ([v5 length]) {
      [v4 addObject:v5];
    }
    v6 = [(CNContact *)self->super.super._contact phoneNumbers];
    objc_super v7 = [v6 firstObject];
    v8 = [v7 value];
    v9 = [v8 stringValue];

    if ([v9 length])
    {
      uint64_t v10 = TUFormattedPhoneNumber();
      id v11 = (void *)v10;
      if (v10) {
        v12 = (void *)v10;
      }
      else {
        v12 = v9;
      }
      v13 = v4;
    }
    else
    {
      v20 = [(CNContact *)self->super.super._contact emailAddresses];
      v21 = [v20 firstObject];
      id v11 = [v21 value];

      if (![v11 length])
      {
        v29 = [(CNContact *)self->super.super._contact postalAddresses];
        v30 = [v29 firstObject];
        v31 = [v30 value];

        if (v31)
        {
          v46 = v11;
          v32 = [MEMORY[0x1E4F1BA88] stringFromPostalAddress:v31 style:0];
          v33 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
          v34 = [v32 componentsSeparatedByCharactersInSet:v33];

          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v36 = v34;
          uint64_t v37 = [v36 countByEnumeratingWithState:&v47 objects:v51 count:16];
          if (v37)
          {
            uint64_t v38 = v37;
            uint64_t v39 = *(void *)v48;
            v45 = v35;
            while (2)
            {
              for (uint64_t i = 0; i != v38; ++i)
              {
                if (*(void *)v48 != v39) {
                  objc_enumerationMutation(v36);
                }
                v41 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                v42 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
                v43 = [v41 stringByTrimmingCharactersInSet:v42];

                if ([v43 length])
                {
                  id v35 = v45;
                  [v45 addObject:v43];

                  goto LABEL_38;
                }
              }
              uint64_t v38 = [v36 countByEnumeratingWithState:&v47 objects:v51 count:16];
              id v35 = v45;
              if (v38) {
                continue;
              }
              break;
            }
          }
LABEL_38:

          if ([v36 count])
          {
            v44 = [v35 componentsJoinedByString:@" "];
            [v4 addObject:v44];
          }
          id v11 = v46;
        }

LABEL_16:
        if ([v4 count] == 1)
        {
          v22 = NSString;
          v23 = DDLocalizedString(@"Add “%@” to Contacts");
          v24 = [v4 objectAtIndexedSubscript:0];
          v19 = objc_msgSend(v22, "stringWithFormat:", v23, v24);
        }
        else
        {
          unint64_t v25 = [v4 count];
          v26 = NSString;
          if (v25 < 2)
          {
            v23 = DDLocalizedString(@"Add VCard to Contacts");
            v19 = [v26 stringWithFormat:v23];
            goto LABEL_22;
          }
          v23 = DDLocalizedString(@"Add “%@” to Contacts\n%@");
          v24 = [v4 objectAtIndexedSubscript:0];
          v27 = [v4 objectAtIndexedSubscript:1];
          v19 = objc_msgSend(v26, "stringWithFormat:", v23, v24, v27);
        }
LABEL_22:

        goto LABEL_23;
      }
      v13 = v4;
      v12 = v11;
    }
    [v13 addObject:v12];
    goto LABEL_16;
  }
  url = self->super.super._url;
  uint64_t v15 = (uint64_t)self->super.super._result;
  if (!((unint64_t)url | v15)
    || (_displayString(url, v15, 0, 0, 1), (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v19 = 0;
    goto LABEL_24;
  }
  id v4 = (id)v16;
  v17 = NSString;
  uint64_t v18 = DDLocalizedString(@"Add location “%@” to Contacts");
  v19 = objc_msgSend(v17, "stringWithFormat:", v18, v4);

LABEL_23:
LABEL_24:
  return v19;
}

- (id)notificationIconBundleIdentifier
{
  return @"com.apple.MobileAddressBook";
}

- (id)notificationURL
{
  return (id)[MEMORY[0x1E4F1CB10] URLWithString:@"x-barcode-datadetectors-action:contact"];
}

@end