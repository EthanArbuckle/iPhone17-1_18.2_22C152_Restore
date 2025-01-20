@interface CalDAVCalendarServerInviteNotificationItem
- (BOOL)isComponentSupportedForString:(id)a3;
- (CalDAVCalendarServerAccessItem)access;
- (CalDAVCalendarServerInviteNotificationItem)init;
- (CalDAVCalendarServerOrganizerItem)organizer;
- (CalDAVSupportedCalendarComponentSet)supportedCalendarComponentSet;
- (CoreDAVHrefItem)href;
- (CoreDAVItemWithHrefChildItem)hostURL;
- (CoreDAVItemWithNoChildren)calendarPublic;
- (CoreDAVItemWithNoChildren)inviteStatus;
- (CoreDAVLeafItem)summary;
- (CoreDAVLeafItem)uid;
- (id)copyParseRules;
- (id)initForReplyWithUID:(id)a3 href:(id)a4 hostURL:(id)a5 summary:(id)a6;
- (void)setAccess:(id)a3;
- (void)setCalendarPublic:(id)a3;
- (void)setHostURL:(id)a3;
- (void)setHref:(id)a3;
- (void)setInviteStatus:(id)a3;
- (void)setOrganizer:(id)a3;
- (void)setSummary:(id)a3;
- (void)setSupportedCalendarComponentSet:(id)a3;
- (void)setUid:(id)a3;
@end

@implementation CalDAVCalendarServerInviteNotificationItem

- (CalDAVCalendarServerInviteNotificationItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"invite-notification"];
}

- (id)initForReplyWithUID:(id)a3 href:(id)a4 hostURL:(id)a5 summary:(id)a6
{
  id v26 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = *MEMORY[0x263F34DA8];
  v14 = [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"invite-notification"];
  if (v14)
  {
    id v15 = objc_alloc(MEMORY[0x263F34AF0]);
    uint64_t v16 = *MEMORY[0x263F34E10];
    uint64_t v17 = *MEMORY[0x263F34E50];
    v18 = (void *)[v15 initWithNameSpace:*MEMORY[0x263F34E10] andName:*MEMORY[0x263F34E50]];
    v19 = [v10 absoluteString];
    [v18 setPayloadAsString:v19];

    [(CalDAVCalendarServerInviteNotificationItem *)v14 setHref:v18];
    v20 = (void *)[objc_alloc(MEMORY[0x263F34B08]) initWithNameSpace:v13 andName:@"hosturl"];
    v21 = (void *)[objc_alloc(MEMORY[0x263F34AF0]) initWithNameSpace:v16 andName:v17];
    v22 = [v11 absoluteString];
    [v21 setPayloadAsString:v22];

    [v20 setHref:v21];
    [(CalDAVCalendarServerInviteNotificationItem *)v14 setHostURL:v20];
    v23 = (void *)[objc_alloc(MEMORY[0x263F34B28]) initWithNameSpace:v13 andName:@"uid"];
    [v23 setPayloadAsString:v26];
    [(CalDAVCalendarServerInviteNotificationItem *)v14 setUid:v23];
    v24 = (void *)[objc_alloc(MEMORY[0x263F34B28]) initWithNameSpace:v13 andName:@"summary"];
    [v24 setPayloadAsString:v12];
    [(CalDAVCalendarServerInviteNotificationItem *)v14 setSummary:v24];
  }
  return v14;
}

- (id)copyParseRules
{
  id v21 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v35 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"uid" objectClass:objc_opt_class() setterMethod:sel_setUid_];
  v34 = [NSString stringWithFormat:@"%@:%@", v2, @"uid"];
  uint64_t v3 = *MEMORY[0x263F34E10];
  uint64_t v4 = *MEMORY[0x263F34E50];
  v33 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E50] objectClass:objc_opt_class() setterMethod:sel_setHref_];
  v32 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  v31 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-noresponse" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v30 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-noresponse"];
  v29 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-deleted" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v28 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-deleted"];
  v27 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-accepted" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  id v26 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-accepted"];
  v25 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-declined" objectClass:objc_opt_class() setterMethod:sel_setInviteStatus_];
  v24 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-declined"];
  uint64_t v5 = *MEMORY[0x263F34CD8];
  uint64_t v6 = *MEMORY[0x263F34F40];
  v23 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34F40] objectClass:objc_opt_class() setterMethod:sel_setSupportedCalendarComponentSet_];
  v20 = [NSString stringWithFormat:@"%@:%@", v5, v6];
  v19 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v2 elementName:@"access" objectClass:objc_opt_class() setterMethod:sel_setAccess_];
  v18 = [NSString stringWithFormat:@"%@:%@", v2, @"access"];
  uint64_t v17 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v2 elementName:@"hosturl" objectClass:objc_opt_class() setterMethod:sel_setHostURL_];
  uint64_t v16 = [NSString stringWithFormat:@"%@:%@", v2, @"hosturl"];
  id v15 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v2 elementName:@"organizer" objectClass:objc_opt_class() setterMethod:sel_setOrganizer_];
  v14 = [NSString stringWithFormat:@"%@:%@", v2, @"organizer"];
  uint64_t v13 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:v2 elementName:@"summary" objectClass:objc_opt_class() setterMethod:sel_setSummary_];
  id v12 = [NSString stringWithFormat:@"%@:%@", v2, @"summary"];
  id v11 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"calendar-public" objectClass:objc_opt_class() setterMethod:sel_setCalendarPublic_];
  v7 = [NSString stringWithFormat:@"%@:%@", v2, @"calendar-public"];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"calendar-not-public" objectClass:objc_opt_class() setterMethod:sel_setCalendarPublic_];
  v9 = [NSString stringWithFormat:@"%@:%@", v2, @"calendar-not-public"];
  v22 = objc_msgSend(v21, "initWithObjectsAndKeys:", v35, v34, v33, v32, v31, v30, v29, v28, v27, v26, v25, v24, v23, v20, v19, v18, v17,
                  v16,
                  v15,
                  v14,
                  v13,
                  v12,
                  v11,
                  v7,
                  v8,
                  v9,
                  0);

  return v22;
}

- (BOOL)isComponentSupportedForString:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CalDAVCalendarServerInviteNotificationItem *)self supportedCalendarComponentSet];

  if (v5)
  {
    uint64_t v6 = [(CalDAVCalendarServerInviteNotificationItem *)self supportedCalendarComponentSet];
    v7 = [v6 compNames];
    char v8 = [v7 containsObject:v4];
  }
  else
  {
    char v8 = 1;
  }

  return v8;
}

- (CoreDAVLeafItem)uid
{
  return self->_uid;
}

- (void)setUid:(id)a3
{
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

- (CoreDAVItemWithNoChildren)calendarPublic
{
  return self->_calendarPublic;
}

- (void)setCalendarPublic:(id)a3
{
}

- (CalDAVCalendarServerAccessItem)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
}

- (CoreDAVItemWithHrefChildItem)hostURL
{
  return self->_hostURL;
}

- (void)setHostURL:(id)a3
{
}

- (CalDAVCalendarServerOrganizerItem)organizer
{
  return self->_organizer;
}

- (void)setOrganizer:(id)a3
{
}

- (CoreDAVLeafItem)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (CalDAVSupportedCalendarComponentSet)supportedCalendarComponentSet
{
  return self->_supportedCalendarComponentSet;
}

- (void)setSupportedCalendarComponentSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedCalendarComponentSet, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_organizer, 0);
  objc_storeStrong((id *)&self->_hostURL, 0);
  objc_storeStrong((id *)&self->_access, 0);
  objc_storeStrong((id *)&self->_calendarPublic, 0);
  objc_storeStrong((id *)&self->_inviteStatus, 0);
  objc_storeStrong((id *)&self->_href, 0);
  objc_storeStrong((id *)&self->_uid, 0);
}

@end