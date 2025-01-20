@interface CalDAVCalendarServerNotificationTypeItem
- (BOOL)isInviteNotification;
- (BOOL)isInviteReply;
- (BOOL)isResourceChanged;
- (BOOL)notificationNameIn:(id)a3;
- (BOOL)notificationNameMatches:(id)a3;
- (CoreDAVItemWithNoChildren)inviteNotification;
- (CoreDAVItemWithNoChildren)inviteReply;
- (CoreDAVItemWithNoChildren)resourceChanged;
- (id)copyParseRules;
- (id)description;
- (void)setInviteNotification:(id)a3;
- (void)setInviteReply:(id)a3;
- (void)setResourceChanged:(id)a3;
@end

@implementation CalDAVCalendarServerNotificationTypeItem

- (id)copyParseRules
{
  id v11 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v3 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"invite-notification" objectClass:objc_opt_class() setterMethod:sel_setInviteNotification_];
  v4 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-notification"];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"invite-reply" objectClass:objc_opt_class() setterMethod:sel_setInviteReply_];
  v6 = [NSString stringWithFormat:@"%@:%@", v2, @"invite-reply"];
  v7 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"resource-changed" objectClass:objc_opt_class() setterMethod:sel_setResourceChanged_];
  v8 = [NSString stringWithFormat:@"%@:%@", v2, @"resource-changed"];
  v9 = objc_msgSend(v11, "initWithObjectsAndKeys:", v3, v4, v5, v6, v7, v8, 0);

  return v9;
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: ", v5, self];

  objc_msgSend(v6, "appendFormat:", @" isInviteReply %d", -[CalDAVCalendarServerNotificationTypeItem isInviteReply](self, "isInviteReply"));
  objc_msgSend(v6, "appendFormat:", @"\n\tisInviteNotification %d", -[CalDAVCalendarServerNotificationTypeItem isInviteNotification](self, "isInviteNotification"));
  objc_msgSend(v6, "appendFormat:", @"\n\tisResourceChanged %d", -[CalDAVCalendarServerNotificationTypeItem isResourceChanged](self, "isResourceChanged"));
  return v6;
}

- (BOOL)isInviteNotification
{
  uint64_t v2 = [(CalDAVCalendarServerNotificationTypeItem *)self inviteNotification];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isInviteReply
{
  uint64_t v2 = [(CalDAVCalendarServerNotificationTypeItem *)self inviteReply];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isResourceChanged
{
  uint64_t v2 = [(CalDAVCalendarServerNotificationTypeItem *)self resourceChanged];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)notificationNameMatches:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"invite-notification"])
  {
    BOOL v5 = [(CalDAVCalendarServerNotificationTypeItem *)self isInviteNotification];
  }
  else if ([v4 isEqualToString:@"invite-reply"])
  {
    BOOL v5 = [(CalDAVCalendarServerNotificationTypeItem *)self isInviteReply];
  }
  else
  {
    if (![v4 isEqualToString:@"resource-changed"])
    {
      BOOL v6 = 0;
      goto LABEL_8;
    }
    BOOL v5 = [(CalDAVCalendarServerNotificationTypeItem *)self isResourceChanged];
  }
  BOOL v6 = v5;
LABEL_8:

  return v6;
}

- (BOOL)notificationNameIn:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
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
        if (-[CalDAVCalendarServerNotificationTypeItem notificationNameMatches:](self, "notificationNameMatches:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11))
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

- (CoreDAVItemWithNoChildren)inviteNotification
{
  return self->_inviteNotification;
}

- (void)setInviteNotification:(id)a3
{
}

- (CoreDAVItemWithNoChildren)inviteReply
{
  return self->_inviteReply;
}

- (void)setInviteReply:(id)a3
{
}

- (CoreDAVItemWithNoChildren)resourceChanged
{
  return self->_resourceChanged;
}

- (void)setResourceChanged:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceChanged, 0);
  objc_storeStrong((id *)&self->_inviteReply, 0);
  objc_storeStrong((id *)&self->_inviteNotification, 0);
}

@end