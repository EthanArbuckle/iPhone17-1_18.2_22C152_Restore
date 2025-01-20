@interface CoreDAVCalendarServerPushTransportsItem
+ (id)copyParseRules;
- (CoreDAVCalendarServerPushTransportsItem)init;
- (NSMutableSet)transports;
- (id)description;
- (void)addTransport:(id)a3;
- (void)setTransports:(id)a3;
@end

@implementation CoreDAVCalendarServerPushTransportsItem

- (CoreDAVCalendarServerPushTransportsItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"http://calendarserver.org/ns/" andName:@"push-transports"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v7.receiver = self;
  v7.super_class = (Class)CoreDAVCalendarServerPushTransportsItem;
  v4 = [(CoreDAVItem *)&v7 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVCalendarServerPushTransportsItem *)self transports];
  objc_msgSend(v3, "appendFormat:", @"\n  Number of transports: [%lu]", objc_msgSend(v5, "count"));

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v6 = objc_alloc(NSDictionary);
    objc_super v7 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:@"http://calendarserver.org/ns/" elementName:@"transport" objectClass:objc_opt_class() setterMethod:sel_addTransport_];
    v8 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"transport"];
    v5 = objc_msgSend(v6, "initWithObjectsAndKeys:", v7, v8, 0);

    v9 = +[CoreDAVItem parseRuleCache];
    v10 = NSStringFromClass((Class)a1);
    [v9 setObject:v5 forKey:v10];
  }
  return v5;
}

- (void)addTransport:(id)a3
{
  id v4 = a3;
  v5 = [(CoreDAVCalendarServerPushTransportsItem *)self transports];

  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF9C0]);
    [(CoreDAVCalendarServerPushTransportsItem *)self setTransports:v6];
  }
  id v7 = [(CoreDAVCalendarServerPushTransportsItem *)self transports];
  [v7 addObject:v4];
}

- (NSMutableSet)transports
{
  return self->_transports;
}

- (void)setTransports:(id)a3
{
}

- (void).cxx_destruct
{
}

@end