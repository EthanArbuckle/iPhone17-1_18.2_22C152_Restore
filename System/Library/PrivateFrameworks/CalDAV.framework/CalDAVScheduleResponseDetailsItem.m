@interface CalDAVScheduleResponseDetailsItem
- (CoreDAVErrorItem)topLevelErrorItem;
- (CoreDAVItemWithHrefChildItem)recipientHREF;
- (CoreDAVLeafItem)requestStatus;
- (ICSDocument)calendarData;
- (NSString)recipientString;
- (NSString)responseDescription;
- (id)copyParseRules;
- (id)description;
- (void)_setCalendarDataWithLeafItem:(id)a3;
- (void)setCalendarData:(id)a3;
- (void)setRecipientHREF:(id)a3;
- (void)setRequestStatus:(id)a3;
- (void)setResponseDescription:(id)a3;
- (void)setTopLevelErrorItem:(id)a3;
@end

@implementation CalDAVScheduleResponseDetailsItem

- (void)_setCalendarDataWithLeafItem:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F886E8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v8 = [v5 payloadAsString];

  v7 = (void *)[v6 initWithICSString:v8 options:0 error:0];
  [(CalDAVScheduleResponseDetailsItem *)self setCalendarData:v7];
}

- (id)copyParseRules
{
  id v17 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34CD8];
  v16 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34CD8] elementName:@"recipient" objectClass:objc_opt_class() setterMethod:sel_setRecipientHREF_];
  v15 = [NSString stringWithFormat:@"%@:%@", v2, @"recipient"];
  v14 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"request-status" objectClass:objc_opt_class() setterMethod:sel_setRequestStatus_];
  v3 = [NSString stringWithFormat:@"%@:%@", v2, @"request-status"];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"calendar-data" objectClass:objc_opt_class() setterMethod:sel__setCalendarDataWithLeafItem_];
  id v5 = [NSString stringWithFormat:@"%@:%@", v2, @"calendar-data"];
  uint64_t v6 = *MEMORY[0x263F34E10];
  uint64_t v7 = *MEMORY[0x263F34E20];
  id v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E20] objectClass:objc_opt_class() setterMethod:sel_setTopLevelErrorItem_];
  v9 = [NSString stringWithFormat:@"%@:%@", v6, v7];
  uint64_t v10 = *MEMORY[0x263F34F08];
  v11 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v6 elementName:*MEMORY[0x263F34F08] objectClass:objc_opt_class() setterMethod:sel_setResponseDescription_];
  v12 = [NSString stringWithFormat:@"%@:%@", v6, v10];
  v18 = objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v15, v14, v3, v4, v5, v8, v9, v11, v12, 0);

  return v18;
}

- (NSString)recipientString
{
  uint64_t v2 = [(CalDAVScheduleResponseDetailsItem *)self recipientHREF];
  v3 = [v2 href];
  v4 = [v3 payloadAsString];

  return (NSString *)v4;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  recipientHREF = self->_recipientHREF;
  uint64_t v7 = [(CoreDAVLeafItem *)self->_requestStatus payloadAsString];
  id v8 = [v3 stringWithFormat:@"%@ %p: RecipientHREF: %@, RequestStatus: %@ CalendarData:\n%@ TopLevelErrorItem: %@ ResponseDescription:\n%@\n", v5, self, recipientHREF, v7, self->_calendarData, self->_topLevelErrorItem, self->_responseDescription];

  return v8;
}

- (CoreDAVItemWithHrefChildItem)recipientHREF
{
  return self->_recipientHREF;
}

- (void)setRecipientHREF:(id)a3
{
}

- (CoreDAVLeafItem)requestStatus
{
  return self->_requestStatus;
}

- (void)setRequestStatus:(id)a3
{
}

- (ICSDocument)calendarData
{
  return self->_calendarData;
}

- (void)setCalendarData:(id)a3
{
}

- (CoreDAVErrorItem)topLevelErrorItem
{
  return self->_topLevelErrorItem;
}

- (void)setTopLevelErrorItem:(id)a3
{
}

- (NSString)responseDescription
{
  return self->_responseDescription;
}

- (void)setResponseDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDescription, 0);
  objc_storeStrong((id *)&self->_topLevelErrorItem, 0);
  objc_storeStrong((id *)&self->_calendarData, 0);
  objc_storeStrong((id *)&self->_requestStatus, 0);
  objc_storeStrong((id *)&self->_recipientHREF, 0);
}

@end