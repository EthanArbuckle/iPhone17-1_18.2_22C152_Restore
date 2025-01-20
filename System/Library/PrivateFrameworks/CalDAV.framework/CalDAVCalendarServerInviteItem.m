@interface CalDAVCalendarServerInviteItem
- (CalDAVCalendarServerInviteItem)init;
- (CalDAVCalendarServerInviteItem)initWithNameSpace:(id)a3 andName:(id)a4;
- (NSMutableSet)users;
- (id)copyParseRules;
- (void)addUser:(id)a3;
- (void)setUsers:(id)a3;
@end

@implementation CalDAVCalendarServerInviteItem

- (CalDAVCalendarServerInviteItem)init
{
  return [(CalDAVCalendarServerInviteItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"invite"];
}

- (CalDAVCalendarServerInviteItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarServerInviteItem;
  v4 = [(CoreDAVItem *)&v8 initWithNameSpace:a3 andName:a4];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    users = v4->_users;
    v4->_users = v5;
  }
  return v4;
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"user" objectClass:objc_opt_class() setterMethod:sel_addUser_];
  v5 = [NSString stringWithFormat:@"%@:%@", v3, @"user"];
  v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (void)addUser:(id)a3
{
  id v4 = a3;
  id v5 = [(CalDAVCalendarServerInviteItem *)self users];
  [v5 addObject:v4];
}

- (NSMutableSet)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end