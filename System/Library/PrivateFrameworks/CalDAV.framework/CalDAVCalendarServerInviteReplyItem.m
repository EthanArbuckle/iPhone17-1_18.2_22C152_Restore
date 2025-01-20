@interface CalDAVCalendarServerInviteReplyItem
- (CalDAVCalendarServerInviteReplyItem)init;
- (CoreDAVHrefItem)href;
- (CoreDAVItemWithHrefChildItem)hostURL;
- (CoreDAVItemWithNoChildren)inviteStatus;
- (CoreDAVLeafItem)inReplyTo;
- (CoreDAVLeafItem)summary;
- (NSString)firstName;
- (NSString)lastName;
- (NSURL)acceptedURL;
- (id)copyParseRules;
- (void)setAcceptedURL:(id)a3;
- (void)setAcceptedURLItem:(id)a3;
- (void)setFirstName:(id)a3;
- (void)setFirstNameItem:(id)a3;
- (void)setHostURL:(id)a3;
- (void)setHref:(id)a3;
- (void)setInReplyTo:(id)a3;
- (void)setInviteStatus:(id)a3;
- (void)setLastName:(id)a3;
- (void)setLastNameItem:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation CalDAVCalendarServerInviteReplyItem

- (CalDAVCalendarServerInviteReplyItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"invite-reply"];
}

- (void)setFirstNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerInviteReplyItem *)self setFirstName:v4];
}

- (void)setLastNameItem:(id)a3
{
  id v4 = [a3 payloadAsString];
  [(CalDAVCalendarServerInviteReplyItem *)self setLastName:v4];
}

- (void)setAcceptedURLItem:(id)a3
{
  id v5 = [a3 href];
  id v4 = [v5 payloadAsFullURL];
  [(CalDAVCalendarServerInviteReplyItem *)self setAcceptedURL:v4];
}

- (id)copyParseRules
{
  id v19 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34E10];
  uint64_t v3 = *MEMORY[0x263F34E50];
  v29 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E50] objectClass:objc_opt_class() setterMethod:sel_setHref_];
  v28 = [NSString stringWithFormat:@"%@:%@", v2, v3];
  uint64_t v4 = *MEMORY[0x263F34DA8];
  v27 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"invite-noresponse" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v26 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-noresponse"];
  v25 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-deleted" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v24 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-deleted"];
  v23 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-accepted" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v22 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-accepted"];
  v21 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"invite-declined" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v18 = [NSString stringWithFormat:@"%@:%@", v4, @"invite-declined"];
  v17 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v4 elementName:@"hosturl" objectClass:objc_opt_class() setterMethod:sel_setHostURL_];
  v16 = [NSString stringWithFormat:@"%@:%@", v4, @"hosturl"];
  v15 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v4 elementName:@"in-reply-to" objectClass:objc_opt_class() setterMethod:sel_setInReplyTo_];
  v14 = [NSString stringWithFormat:@"%@:%@", v4, @"in-reply-to"];
  v12 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"summary" objectClass:objc_opt_class() setterMethod:sel_setSummary_];
  v13 = [NSString stringWithFormat:@"%@:%@", v4, @"summary"];
  v11 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"first-name" objectClass:objc_opt_class() setterMethod:sel_setFirstNameItem_];
  v10 = [NSString stringWithFormat:@"%@:%@", v4, @"first-name"];
  id v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v4 elementName:@"last-name" objectClass:objc_opt_class() setterMethod:sel_setLastNameItem_];
  v6 = [NSString stringWithFormat:@"%@:%@", v4, @"last-name"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v4 elementName:@"accepted-sharee-url" objectClass:objc_opt_class() setterMethod:sel_setAcceptedURLItem_];
  v8 = [NSString stringWithFormat:@"%@:%@", v4, @"accepted-sharee-url"];
  v20 = objc_msgSend(v19, "initWithObjectsAndKeys:", v29, v28, v27, v26, v25, v24, v23, v22, v21, v18, v17, v16, v15, v14, v12, v13, v11,
                  v10,
                  v5,
                  v6,
                  v7,
                  v8,
                  0);

  return v20;
}

- (CoreDAVHrefItem)href
{
  return self->_href;
}

- (void)setHref:(id)a3
{
}

- (CoreDAVItemWithNoChildren)inviteStatus
{
  return self->_inviteStatus;
}

- (void)setInviteStatus:(id)a3
{
}

- (CoreDAVItemWithHrefChildItem)hostURL
{
  return self->_hostURL;
}

- (void)setHostURL:(id)a3
{
}

- (CoreDAVLeafItem)inReplyTo
{
  return self->_inReplyTo;
}

- (void)setInReplyTo:(id)a3
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
  objc_storeStrong((id *)&self->_inReplyTo, 0);
  objc_storeStrong((id *)&self->_hostURL, 0);
  objc_storeStrong((id *)&self->_inviteStatus, 0);
  objc_storeStrong((id *)&self->_href, 0);
}

@end