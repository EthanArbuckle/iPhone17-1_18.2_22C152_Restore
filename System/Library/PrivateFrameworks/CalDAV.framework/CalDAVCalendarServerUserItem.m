@interface CalDAVCalendarServerUserItem
- (CalDAVCalendarServerAccessItem)access;
- (CalDAVCalendarServerUserItem)init;
- (CalDAVCalendarServerUserItem)initWithHREF:(id)a3 commonName:(id)a4 inviteStatus:(int)a5 access:(int)a6;
- (CoreDAVHrefItem)href;
- (CoreDAVItemWithNoChildren)inviteStatus;
- (CoreDAVLeafItem)commonName;
- (CoreDAVLeafItem)summary;
- (NSString)firstName;
- (NSString)lastName;
- (NSURL)acceptedURL;
- (id)copyParseRules;
- (id)description;
- (int64_t)compare:(id)a3;
- (void)setAcceptedURL:(id)a3;
- (void)setAcceptedURLItem:(id)a3;
- (void)setAccess:(id)a3;
- (void)setCommonName:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFirstNameItem:(id)a3;
- (void)setHref:(id)a3;
- (void)setInviteStatus:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLastNameItem:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation CalDAVCalendarServerUserItem

- (CalDAVCalendarServerUserItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"user"];
}

- (CalDAVCalendarServerUserItem)initWithHREF:(id)a3 commonName:(id)a4 inviteStatus:(int)a5 access:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v10 = a3;
  id v11 = a4;
  v12 = [(CalDAVCalendarServerUserItem *)self init];
  if (v12)
  {
    id v13 = objc_alloc(MEMORY[0x263F34AF0]);
    v14 = (void *)[v13 initWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E50]];
    v15 = [v10 absoluteString];
    [v14 setPayloadAsString:v15];

    [(CalDAVCalendarServerUserItem *)v12 setHref:v14];
    id v16 = objc_alloc(MEMORY[0x263F34B28]);
    uint64_t v17 = *MEMORY[0x263F34DA8];
    v18 = (void *)[v16 initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"common-name"];
    [v18 setPayloadAsString:v11];
    [(CalDAVCalendarServerUserItem *)v12 setCommonName:v18];
    if ((a5 - 1) > 4)
    {
      v20 = 0;
    }
    else
    {
      int v19 = a5 - 1;
      v20 = (void *)[objc_alloc(MEMORY[0x263F34B20]) initWithNameSpace:v17 andName:*off_2641EC030[v19]];
    }
    [(CalDAVCalendarServerUserItem *)v12 setInviteStatus:v20];
    v21 = [[CalDAVCalendarServerAccessItem alloc] initWithAccess:v6];
    [(CalDAVCalendarServerUserItem *)v12 setAccess:v21];
  }
  return v12;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v27.receiver = self;
  v27.super_class = (Class)CalDAVCalendarServerUserItem;
  v4 = [(CoreDAVItem *)&v27 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CalDAVCalendarServerUserItem *)self commonName];
  uint64_t v6 = [v5 payloadAsString];
  [v3 appendFormat:@"\n  Common name: [%@]", v6];

  v7 = [(CalDAVCalendarServerUserItem *)self firstName];
  [v3 appendFormat:@"\n  First Name: [%@]", v7];

  v8 = [(CalDAVCalendarServerUserItem *)self lastName];
  [v3 appendFormat:@"\n  Last Name: [%@]", v8];

  v9 = [(CalDAVCalendarServerUserItem *)self acceptedURL];
  [v3 appendFormat:@"\n  Accepted URL: [%@]", v9];

  id v10 = [(CalDAVCalendarServerUserItem *)self href];
  id v11 = [v10 payloadAsFullURL];
  [v3 appendFormat:@"\n  Full HREF: [%@]", v11];

  v12 = [(CalDAVCalendarServerUserItem *)self href];
  id v13 = [v12 payloadAsOriginalURL];
  [v3 appendFormat:@"\n  Original HREF: [%@]", v13];

  v14 = [(CalDAVCalendarServerUserItem *)self inviteStatus];
  v15 = [v14 nameSpace];
  id v16 = [(CalDAVCalendarServerUserItem *)self inviteStatus];
  uint64_t v17 = [v16 name];
  [v3 appendFormat:@"\n  Invite status: [%@%@]", v15, v17];

  v18 = [(CalDAVCalendarServerUserItem *)self access];
  int v19 = [v18 accessLevel];
  v20 = [v19 nameSpace];
  v21 = [(CalDAVCalendarServerUserItem *)self access];
  v22 = [v21 accessLevel];
  v23 = [v22 name];
  [v3 appendFormat:@"\n  Access level: [%@%@]", v20, v23];

  v24 = [(CalDAVCalendarServerUserItem *)self summary];
  v25 = [v24 payloadAsString];
  [v3 appendFormat:@"\n  Summary: [%@]", v25];

  return v3;
}

- (void)setFirstNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerUserItem *)self setFirstName:v4];
}

- (void)setLastNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerUserItem *)self setLastName:v4];
}

- (void)setAcceptedURLItem:(id)a3
{
  id v5 = [a3 href];
  id v4 = [v5 payloadAsFullURL];
  [(CalDAVCalendarServerUserItem *)self setAcceptedURL:v4];
}

- (id)copyParseRules
{
  id v19 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34E10];
  uint64_t v3 = *MEMORY[0x263F34E50];
  v29 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E50] objectClass:objc_opt_class() setterMethod:sel_setHref_];
  v28 = [NSString stringWithFormat:@"%@:%@", v2, v3];
  uint64_t v4 = *MEMORY[0x263F34DA8];
  objc_super v27 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"first-name" objectClass:objc_opt_class() setterMethod:sel_setFirstNameItem_];
  v26 = [NSString stringWithFormat:@"%@:%@", v4, @"first-name"];
  v25 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"last-name" objectClass:objc_opt_class() setterMethod:sel_setLastNameItem_];
  v24 = [NSString stringWithFormat:@"%@:%@", v4, @"last-name"];
  v23 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"common-name" objectClass:objc_opt_class() setterMethod:sel_setCommonName_];
  v22 = [NSString stringWithFormat:@"%@:%@", v4, @"common-name"];
  v21 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-noresponse" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v18 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-noresponse"];
  uint64_t v17 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-accepted" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  id v16 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-accepted"];
  v15 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-declined" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v14 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-declined"];
  id v13 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-invalid" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  id v5 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-invalid"];
  v12 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v4 elementName:@"access" objectClass:objc_opt_class() setterMethod:sel_setAccess_];
  id v11 = [NSString stringWithFormat:@"%@:%@", v4, @"access"];
  id v10 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"summary" objectClass:objc_opt_class() setterMethod:sel_setSummary_];
  uint64_t v6 = [NSString stringWithFormat:@"%@:%@", v4, @"summary"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v4 elementName:@"accepted-sharee-url" objectClass:objc_opt_class() setterMethod:sel_setAcceptedURLItem_];
  v8 = [NSString stringWithFormat:@"%@:%@", v4, @"accepted-sharee-url"];
  v20 = objc_msgSend(v19, "initWithObjectsAndKeys:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v18, v17, v16, v15, v14, v13, v5, v12,
                  v11,
                  v10,
                  v6,
                  v7,
                  v8,
                  0);

  return v20;
}

- (int64_t)compare:(id)a3
{
  uint64_t v4 = (CalDAVCalendarServerUserItem *)a3;
  if (self == v4)
  {
    int64_t v9 = 0;
  }
  else
  {
    id v5 = [(CalDAVCalendarServerUserItem *)self href];
    uint64_t v6 = [v5 payloadAsString];
    v7 = [(CalDAVCalendarServerUserItem *)v4 href];
    v8 = [v7 payloadAsString];
    int64_t v9 = [v6 compare:v8];

    if (!v9)
    {
      id v10 = [(CalDAVCalendarServerUserItem *)self access];
      id v11 = [v10 accessLevel];
      v12 = [v11 name];
      id v13 = [(CalDAVCalendarServerUserItem *)v4 access];
      v14 = [v13 accessLevel];
      v15 = [v14 name];
      int64_t v9 = [v12 compare:v15];

      if (!v9)
      {
        id v16 = [(CalDAVCalendarServerUserItem *)self inviteStatus];
        uint64_t v17 = [v16 name];
        v18 = [(CalDAVCalendarServerUserItem *)v4 inviteStatus];
        id v19 = [v18 name];
        int64_t v9 = [v17 compare:v19];

        if (!v9)
        {
          v20 = [(CalDAVCalendarServerUserItem *)self commonName];
          v21 = [v20 payloadAsString];
          v22 = [(CalDAVCalendarServerUserItem *)v4 commonName];
          v23 = [v22 payloadAsString];
          int64_t v9 = [v21 compare:v23];
        }
      }
    }
  }

  return v9;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (CoreDAVLeafItem)commonName
{
  return self->_commonName;
}

- (void)setCommonName:(id)a3
{
}

- (CoreDAVItemWithNoChildren)inviteStatus
{
  return self->_inviteStatus;
}

- (void)setInviteStatus:(id)a3
{
}

- (CalDAVCalendarServerAccessItem)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

- (CoreDAVLeafItem)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
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

- (NSURL)acceptedURL
{
  return self->_acceptedURL;
}

- (void)setAcceptedURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptedURL, 0);
  objc_storeStrong((id *)&self->_lastName, 0);
  objc_storeStrong((id *)&self->_firstName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_inviteStatus, 0);
  objc_storeStrong((id *)&self->_commonName, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end