@interface CalDAVResourceTypeItem
- (CoreDAVItemWithNoChildren)calendar;
- (CoreDAVItemWithNoChildren)isFamilyCalendar;
- (CoreDAVItemWithNoChildren)notification;
- (CoreDAVItemWithNoChildren)scheduleInbox;
- (CoreDAVItemWithNoChildren)scheduleOutbox;
- (CoreDAVItemWithNoChildren)sharedOwner;
- (CoreDAVItemWithNoChildren)subscribed;
- (id)copyParseRules;
- (void)setCalendar:(id)a3;
- (void)setIsFamilyCalendar:(id)a3;
- (void)setNotification:(id)a3;
- (void)setScheduleInbox:(id)a3;
- (void)setScheduleOutbox:(id)a3;
- (void)setSharedOwner:(id)a3;
- (void)setSubscribed:(id)a3;
- (void)write:(id)a3;
@end

@implementation CalDAVResourceTypeItem

- (id)copyParseRules
{
  id v24 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v2 = *MEMORY[0x263F34CD8];
  uint64_t v3 = *MEMORY[0x263F34CE8];
  v28 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34CE8] objectClass:objc_opt_class() setterMethod:sel_setCalendar_];
  v27 = [NSString stringWithFormat:@"%@:%@", v2, v3];
  uint64_t v4 = *MEMORY[0x263F34F20];
  v23 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:*MEMORY[0x263F34F20] objectClass:objc_opt_class() setterMethod:sel_setScheduleInbox_];
  v22 = [NSString stringWithFormat:@"%@:%@", v2, v4];
  uint64_t v5 = *MEMORY[0x263F34F28];
  v21 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:*MEMORY[0x263F34F28] objectClass:objc_opt_class() setterMethod:sel_setScheduleOutbox_];
  v20 = [NSString stringWithFormat:@"%@:%@", v2, v5];
  uint64_t v6 = *MEMORY[0x263F34DA8];
  uint64_t v7 = *MEMORY[0x263F34E58];
  v19 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:*MEMORY[0x263F34E58] objectClass:objc_opt_class() setterMethod:sel_setIsFamilyCalendar_];
  v18 = [NSString stringWithFormat:@"%@:%@", v6, v7];
  uint64_t v8 = *MEMORY[0x263F34EC8];
  v17 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v6 elementName:*MEMORY[0x263F34EC8] objectClass:objc_opt_class() setterMethod:sel_setNotification_];
  v16 = [NSString stringWithFormat:@"%@:%@", v6, v8];
  uint64_t v9 = *MEMORY[0x263F34F38];
  v10 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v6 elementName:*MEMORY[0x263F34F38] objectClass:objc_opt_class() setterMethod:sel_setSubscribed_];
  v11 = [NSString stringWithFormat:@"%@:%@", v6, v9];
  v12 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v6 elementName:@"shared-owner" objectClass:objc_opt_class() setterMethod:sel_setSharedOwner_];
  v13 = [NSString stringWithFormat:@"%@:%@", v6, @"shared-owner"];
  v25 = objc_msgSend(v24, "initWithObjectsAndKeys:", v28, v27, v23, v22, v21, v20, v19, v18, v17, v16, v10, v11, v12, v13, 0);

  v29.receiver = self;
  v29.super_class = (Class)CalDAVResourceTypeItem;
  id v14 = [(CoreDAVItem *)&v29 copyParseRules];
  [v25 addEntriesFromDictionary:v14];

  return v25;
}

- (void)write:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(CoreDAVItem *)self name];
  uint64_t v6 = [(CoreDAVItem *)self nameSpace];
  [v4 startElement:v5 inNamespace:v6 withAttributeNamesAndValues:0];

  uint64_t v7 = [(CalDAVResourceTypeItem *)self calendar];

  if (v7)
  {
    uint64_t v8 = [(CalDAVResourceTypeItem *)self calendar];
    [v8 write:v4];
  }
  uint64_t v9 = [(CalDAVResourceTypeItem *)self scheduleInbox];

  if (v9)
  {
    v10 = [(CalDAVResourceTypeItem *)self scheduleInbox];
    [v10 write:v4];
  }
  v11 = [(CalDAVResourceTypeItem *)self scheduleOutbox];

  if (v11)
  {
    v12 = [(CalDAVResourceTypeItem *)self scheduleOutbox];
    [v12 write:v4];
  }
  v13 = [(CalDAVResourceTypeItem *)self notification];

  if (v13)
  {
    id v14 = [(CalDAVResourceTypeItem *)self notification];
    [v14 write:v4];
  }
  v15 = [(CalDAVResourceTypeItem *)self subscribed];

  if (v15)
  {
    v16 = [(CalDAVResourceTypeItem *)self subscribed];
    [v16 write:v4];
  }
  v17 = [(CalDAVResourceTypeItem *)self sharedOwner];

  if (v17)
  {
    v18 = [(CalDAVResourceTypeItem *)self sharedOwner];
    [v18 write:v4];
  }
  v19 = [(CoreDAVResourceTypeItem *)self shared];

  if (v19)
  {
    v20 = [(CoreDAVResourceTypeItem *)self shared];
    [v20 write:v4];
  }
  v21 = [(CoreDAVResourceTypeItem *)self addressBook];

  if (v21)
  {
    v22 = [(CoreDAVResourceTypeItem *)self addressBook];
    [v22 write:v4];
  }
  v23 = [(CoreDAVResourceTypeItem *)self searchAddressBook];

  if (v23)
  {
    id v24 = [(CoreDAVResourceTypeItem *)self searchAddressBook];
    [v24 write:v4];
  }
  v25 = [(CoreDAVResourceTypeItem *)self principal];

  if (v25)
  {
    v26 = [(CoreDAVResourceTypeItem *)self principal];
    [v26 write:v4];
  }
  v27 = [(CoreDAVResourceTypeItem *)self collection];

  if (v27)
  {
    v28 = [(CoreDAVResourceTypeItem *)self collection];
    [v28 write:v4];
  }
  objc_super v29 = [(CoreDAVResourceTypeItem *)self unauthenticated];

  if (v29)
  {
    v30 = [(CoreDAVResourceTypeItem *)self unauthenticated];
    [v30 write:v4];
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v31 = [(CoreDAVItem *)self extraChildItems];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v39;
    do
    {
      uint64_t v35 = 0;
      do
      {
        if (*(void *)v39 != v34) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v38 + 1) + 8 * v35++) write:v4];
      }
      while (v33 != v35);
      uint64_t v33 = [v31 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v33);
  }

  v36 = [(CoreDAVItem *)self name];
  v37 = [(CoreDAVItem *)self nameSpace];
  [v4 endElement:v36 inNamespace:v37];
}

- (CoreDAVItemWithNoChildren)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (CoreDAVItemWithNoChildren)scheduleInbox
{
  return self->_scheduleInbox;
}

- (void)setScheduleInbox:(id)a3
{
}

- (CoreDAVItemWithNoChildren)scheduleOutbox
{
  return self->_scheduleOutbox;
}

- (void)setScheduleOutbox:(id)a3
{
}

- (CoreDAVItemWithNoChildren)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (CoreDAVItemWithNoChildren)subscribed
{
  return self->_subscribed;
}

- (void)setSubscribed:(id)a3
{
}

- (CoreDAVItemWithNoChildren)sharedOwner
{
  return self->_sharedOwner;
}

- (void)setSharedOwner:(id)a3
{
}

- (CoreDAVItemWithNoChildren)isFamilyCalendar
{
  return self->_isFamilyCalendar;
}

- (void)setIsFamilyCalendar:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isFamilyCalendar, 0);
  objc_storeStrong((id *)&self->_sharedOwner, 0);
  objc_storeStrong((id *)&self->_subscribed, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_scheduleOutbox, 0);
  objc_storeStrong((id *)&self->_scheduleInbox, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

@end