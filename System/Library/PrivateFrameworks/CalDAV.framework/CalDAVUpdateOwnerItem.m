@interface CalDAVUpdateOwnerItem
- (ICSDateValue)dtstamp;
- (NSString)displayName;
- (NSString)emailAddress;
- (NSString)firstName;
- (NSString)lastName;
- (NSString)phoneNumber;
- (NSURL)address;
- (id)copyParseRules;
- (id)description;
- (void)setAddress:(id)a3;
- (void)setAddressItem:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setDisplayNameItem:(id)a3;
- (void)setDtstamp:(id)a3;
- (void)setDtstampItem:(id)a3;
- (void)setEmailAddress:(id)a3;
- (void)setEmailAddressItem:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFirstNameItem:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLastNameItem:(id)a3;
- (void)setPhoneNumber:(id)a3;
- (void)setPhoneNumberItem:(id)a3;
@end

@implementation CalDAVUpdateOwnerItem

- (id)description
{
  v16 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(CalDAVUpdateOwnerItem *)self firstName];
  v6 = [(CalDAVUpdateOwnerItem *)self lastName];
  v7 = [(CalDAVUpdateOwnerItem *)self displayName];
  uint64_t v8 = [(CalDAVUpdateOwnerItem *)self address];
  v9 = (void *)v8;
  if (v8)
  {
    int v10 = 0;
    v11 = (void *)v8;
  }
  else
  {
    uint64_t v12 = [(CalDAVUpdateOwnerItem *)self emailAddress];
    if (v12)
    {
      int v10 = 0;
      v2 = (void *)v12;
      v11 = (void *)v12;
    }
    else
    {
      v11 = [(CalDAVUpdateOwnerItem *)self phoneNumber];
      v2 = 0;
      int v10 = 1;
    }
  }
  v13 = [(CalDAVUpdateOwnerItem *)self dtstamp];
  v14 = [v16 stringWithFormat:@"[<%@ %p> %@ %@ \"%@\" %@ %@]", v4, self, v5, v6, v7, v11, v13];

  if (v10) {
  if (!v9)
  }

  return v14;
}

- (void)setAddressItem:(id)a3
{
  id v4 = [a3 payloadAsFullURL];
  [(CalDAVUpdateOwnerItem *)self setAddress:v4];
}

- (void)setEmailAddressItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVUpdateOwnerItem *)self setEmailAddress:v4];
}

- (void)setDisplayNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVUpdateOwnerItem *)self setDisplayName:v4];
}

- (void)setFirstNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVUpdateOwnerItem *)self setFirstName:v4];
}

- (void)setLastNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVUpdateOwnerItem *)self setLastName:v4];
}

- (void)setDtstampItem:(id)a3
{
  id v4 = (void *)MEMORY[0x263F886E0];
  id v6 = [a3 payloadAsString];
  v5 = [v4 dateFromICSString:v6];
  [(CalDAVUpdateOwnerItem *)self setDtstamp:v5];
}

- (void)setPhoneNumberItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVUpdateOwnerItem *)self setPhoneNumber:v4];
}

- (id)copyParseRules
{
  id v21 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34E10];
  uint64_t v3 = *MEMORY[0x263F34E50];
  v24 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E50] objectClass:objc_opt_class() setterMethod:sel_setAddressItem_];
  v23 = [NSString stringWithFormat:@"%@:%@", v2, v3];
  uint64_t v4 = *MEMORY[0x263F34DA8];
  uint64_t v5 = *MEMORY[0x263F34D40];
  v20 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:*MEMORY[0x263F34D40] objectClass:objc_opt_class() setterMethod:sel_setEmailAddressItem_];
  v19 = [NSString stringWithFormat:@"%@:%@", v4, v5];
  uint64_t v6 = *MEMORY[0x263F34D60];
  v18 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:*MEMORY[0x263F34D60] objectClass:objc_opt_class() setterMethod:sel_setPhoneNumberItem_];
  v17 = [NSString stringWithFormat:@"%@:%@", v4, v6];
  uint64_t v7 = *MEMORY[0x263F34E18];
  v16 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:*MEMORY[0x263F34E18] objectClass:objc_opt_class() setterMethod:sel_setDisplayNameItem_];
  v14 = [NSString stringWithFormat:@"%@:%@", v2, v7];
  v15 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"first-name" objectClass:objc_opt_class() setterMethod:sel_setFirstNameItem_];
  v13 = [NSString stringWithFormat:@"%@:%@", v4, @"first-name"];
  uint64_t v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"last-name" objectClass:objc_opt_class() setterMethod:sel_setLastNameItem_];
  v9 = [NSString stringWithFormat:@"%@:%@", v4, @"last-name"];
  int v10 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"dtstamp" objectClass:objc_opt_class() setterMethod:sel_setDtstampItem_];
  v11 = [NSString stringWithFormat:@"%@:%@", v4, @"dtstamp"];
  v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v24, v23, v20, v19, v18, v17, v16, v14, v15, v13, v8, v9, v10, v11, 0);

  return v22;
}

- (ICSDateValue)dtstamp
{
  return self->_dtstamp;
}

- (void)setDtstamp:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)firstName
{
  return self->_firstName;
}

- (void)setFirstName:(id)a3
{
}

- (NSString)lastName
{
  return self->_lastName;
}

- (void)setLastName:(id)a3
{
}

- (NSURL)address
{
  return self->_address;
}

- (void)setAddress:(id)a3
{
}

- (NSString)emailAddress
{
  return self->_emailAddress;
}

- (void)setEmailAddress:(id)a3
{
}

- (NSString)phoneNumber
{
  return self->_phoneNumber;
}

- (void)setPhoneNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_address, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_dtstamp, 0);
}

@end