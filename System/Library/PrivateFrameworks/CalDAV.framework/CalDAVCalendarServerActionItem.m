@interface CalDAVCalendarServerActionItem
- (CalDAVCalendarServerActionItem)init;
- (CalDAVCalendarServerCancelItem)cancel;
- (CalDAVCalendarServerReplyItem)reply;
- (CalDAVCalendarServerUpdateItem)update;
- (CoreDAVItemWithNoChildren)create;
- (id)copyParseRules;
- (void)setCancel:(id)a3;
- (void)setCreate:(id)a3;
- (void)setReply:(id)a3;
- (void)setUpdate:(id)a3;
@end

@implementation CalDAVCalendarServerActionItem

- (CalDAVCalendarServerActionItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"action"];
}

- (id)copyParseRules
{
  id v13 = objc_alloc(NSDictionary);
  uint64_t v2 = *MEMORY[0x263F34DA8];
  v12 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"create" objectClass:objc_opt_class() setterMethod:sel_setCreate_];
  v3 = [NSString stringWithFormat:@"%@:%@", v2, @"create"];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"update" objectClass:objc_opt_class() setterMethod:sel_setUpdate_];
  v5 = [NSString stringWithFormat:@"%@:%@", v2, @"update"];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"reply" objectClass:objc_opt_class() setterMethod:sel_setReply_];
  v7 = [NSString stringWithFormat:@"%@:%@", v2, @"reply"];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:v2 elementName:@"cancel" objectClass:objc_opt_class() setterMethod:sel_setCancel_];
  v9 = [NSString stringWithFormat:@"%@:%@", v2, @"cancel"];
  v10 = objc_msgSend(v13, "initWithObjectsAndKeys:", v12, v3, v4, v5, v6, v7, v8, v9, 0);

  return v10;
}

- (CoreDAVItemWithNoChildren)create
{
  return self->_create;
}

- (void)setCreate:(id)a3
{
}

- (CalDAVCalendarServerUpdateItem)update
{
  return self->_update;
}

- (void)setUpdate:(id)a3
{
}

- (CalDAVCalendarServerCancelItem)cancel
{
  return self->_cancel;
}

- (void)setCancel:(id)a3
{
}

- (CalDAVCalendarServerReplyItem)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reply, 0);
  objc_storeStrong((id *)&self->_cancel, 0);
  objc_storeStrong((id *)&self->_update, 0);
  objc_storeStrong((id *)&self->_create, 0);
}

@end