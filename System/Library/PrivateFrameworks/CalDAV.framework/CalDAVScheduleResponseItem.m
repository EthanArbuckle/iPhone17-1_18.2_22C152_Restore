@interface CalDAVScheduleResponseItem
- (NSMutableSet)failedResponseItems;
- (NSMutableSet)responses;
- (NSMutableSet)successfulICS;
- (id)copyParseRules;
- (id)description;
- (void)addNewTopLevelItem:(id)a3;
- (void)setFailedResponseItems:(id)a3;
- (void)setResponses:(id)a3;
- (void)setSuccessfulICS:(id)a3;
@end

@implementation CalDAVScheduleResponseItem

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34CD8];
  uint64_t v4 = *MEMORY[0x263F34F00];
  v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34CD8] elementName:*MEMORY[0x263F34F00] objectClass:objc_opt_class() setterMethod:sel_addNewTopLevelItem_];
  v6 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  v7 = objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, 0);

  return v7;
}

- (void)addNewTopLevelItem:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [(CalDAVScheduleResponseItem *)self responses];

    if (!v6)
    {
      v7 = [MEMORY[0x263EFF9C0] set];
      [(CalDAVScheduleResponseItem *)self setResponses:v7];
    }
    v8 = [(CalDAVScheduleResponseItem *)self responses];
    [v8 addObject:v5];

    v9 = [v5 recipientHREF];
    v10 = [v9 href];
    v11 = [v10 payloadAsString];
    uint64_t v12 = [v11 length];

    if (v12)
    {
      v13 = [v5 requestStatus];
      v14 = [v13 payloadAsString];

      if (([v14 hasPrefix:@"2."] & 1) != 0
        || [v14 hasPrefix:@"1."])
      {
        v15 = [v5 calendarData];

        if (!v15)
        {
LABEL_23:

          goto LABEL_24;
        }
        v16 = [(CalDAVScheduleResponseItem *)self successfulICS];

        if (!v16)
        {
          v17 = [MEMORY[0x263EFF9C0] set];
          [(CalDAVScheduleResponseItem *)self setSuccessfulICS:v17];
        }
        v18 = [(CalDAVScheduleResponseItem *)self successfulICS];
        v19 = [v5 calendarData];
        [v18 addObject:v19];
      }
      else
      {
        v24 = [(CalDAVScheduleResponseItem *)self failedResponseItems];

        if (!v24)
        {
          v25 = [MEMORY[0x263EFF9C0] set];
          [(CalDAVScheduleResponseItem *)self setFailedResponseItems:v25];
        }
        v18 = [(CalDAVScheduleResponseItem *)self failedResponseItems];
        [v18 addObject:v5];
      }

      goto LABEL_23;
    }
    v21 = [MEMORY[0x263F34B30] sharedLogging];
    v22 = [v21 logHandleForAccountInfoProvider:0];
    v23 = v22;
    if (v22 && os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      id v27 = v5;
      _os_log_impl(&dword_213CEC000, v23, OS_LOG_TYPE_DEBUG, "Ignoring strange response item with no parsed recipient %@", (uint8_t *)&v26, 0xCu);
    }
  }
  else
  {
    id v5 = [MEMORY[0x263F34B30] sharedLogging];
    v20 = [v5 logHandleForAccountInfoProvider:0];
    v21 = v20;
    if (v20 && os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      id v27 = v4;
      _os_log_impl(&dword_213CEC000, v21, OS_LOG_TYPE_DEBUG, "Dropping unexpected child %@", (uint8_t *)&v26, 0xCu);
    }
  }

LABEL_24:
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"%@ %p: FailedAttendees:\n%@\nSuccessfulICS:\n%@", v5, self, self->_failedResponseItems, self->_successfulICS];

  return v6;
}

- (NSMutableSet)responses
{
  return self->_responses;
}

- (void)setResponses:(id)a3
{
}

- (NSMutableSet)successfulICS
{
  return self->_successfulICS;
}

- (void)setSuccessfulICS:(id)a3
{
}

- (NSMutableSet)failedResponseItems
{
  return self->_failedResponseItems;
}

- (void)setFailedResponseItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_failedResponseItems, 0);
  objc_storeStrong((id *)&self->_successfulICS, 0);
  objc_storeStrong((id *)&self->_responses, 0);
}

@end