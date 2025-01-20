@interface CoreDAVCalendarServerTransportItem
+ (id)copyParseRules;
- (CoreDAVCalendarServerTransportItem)init;
- (CoreDAVItemWithHrefChildItem)subscriptionURL;
- (CoreDAVItemWithHrefChildItem)tokenURL;
- (CoreDAVLeafItem)apsBundleID;
- (CoreDAVLeafItem)apsEnv;
- (CoreDAVLeafItem)courierServer;
- (CoreDAVLeafItem)refreshInterval;
- (CoreDAVLeafItem)xmppServer;
- (CoreDAVLeafItem)xmppURI;
- (id)description;
- (void)setApsBundleID:(id)a3;
- (void)setApsEnv:(id)a3;
- (void)setCourierServer:(id)a3;
- (void)setRefreshInterval:(id)a3;
- (void)setSubscriptionURL:(id)a3;
- (void)setTokenURL:(id)a3;
- (void)setXmppServer:(id)a3;
- (void)setXmppURI:(id)a3;
@end

@implementation CoreDAVCalendarServerTransportItem

- (CoreDAVCalendarServerTransportItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"http://calendarserver.org/ns/" andName:@"transport"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v24.receiver = self;
  v24.super_class = (Class)CoreDAVCalendarServerTransportItem;
  v4 = [(CoreDAVItem *)&v24 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVCalendarServerTransportItem *)self subscriptionURL];
  v6 = [v5 href];
  v7 = [v6 payloadAsString];
  [v3 appendFormat:@"\n  Subscription URL: [%@]", v7];

  v8 = [(CoreDAVCalendarServerTransportItem *)self tokenURL];
  v9 = [v8 href];
  v10 = [v9 payloadAsString];
  [v3 appendFormat:@"\n  Token URL: [%@]", v10];

  v11 = [(CoreDAVCalendarServerTransportItem *)self apsBundleID];
  v12 = [v11 payloadAsString];
  [v3 appendFormat:@"\n  APS bundle ID: [%@]", v12];

  v13 = [(CoreDAVCalendarServerTransportItem *)self courierServer];
  v14 = [v13 payloadAsString];
  [v3 appendFormat:@"\n  Courier server: [%@]", v14];

  v15 = [(CoreDAVCalendarServerTransportItem *)self apsEnv];
  v16 = [v15 payloadAsString];
  [v3 appendFormat:@"\n  APS Environment: [%@]", v16];

  v17 = [(CoreDAVCalendarServerTransportItem *)self refreshInterval];
  v18 = [v17 payloadAsString];
  [v3 appendFormat:@"\n  Refresh Interval: [%@]", v18];

  v19 = [(CoreDAVCalendarServerTransportItem *)self xmppServer];
  v20 = [v19 payloadAsString];
  [v3 appendFormat:@"\n  XMPP server: [%@]", v20];

  v21 = [(CoreDAVCalendarServerTransportItem *)self xmppURI];
  v22 = [v21 payloadAsString];
  [v3 appendFormat:@"\n  XMPP URI: [%@]", v22];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v21 = objc_alloc(NSDictionary);
    v22 = (objc_class *)a1;
    v28 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"subscription-url" objectClass:objc_opt_class() setterMethod:sel_setSubscriptionURL_];
    v27 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"subscription-url"];
    v26 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"token-url" objectClass:objc_opt_class() setterMethod:sel_setTokenURL_];
    v25 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"token-url"];
    v23 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"apsbundleid" objectClass:objc_opt_class() setterMethod:sel_setApsBundleID_];
    objc_super v24 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"apsbundleid"];
    v20 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://cal.me.com/_namespace/" elementName:@"apsbundleid" objectClass:objc_opt_class() setterMethod:sel_setApsBundleID_];
    v19 = [NSString stringWithFormat:@"%@:%@", @"http://cal.me.com/_namespace/", @"apsbundleid"];
    v18 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"courierserver" objectClass:objc_opt_class() setterMethod:sel_setCourierServer_];
    v17 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"courierserver"];
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"urn:mobileme:davservices" elementName:@"env" objectClass:objc_opt_class() setterMethod:sel_setApsEnv_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"urn:mobileme:davservices", @"env"];
    v14 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"refresh-interval" objectClass:objc_opt_class() setterMethod:sel_setRefreshInterval_];
    v6 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"refresh-interval"];
    v13 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"xmpp-server" objectClass:objc_opt_class() setterMethod:sel_setXmppServer_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"xmpp-server"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"xmpp-uri" objectClass:objc_opt_class() setterMethod:sel_setXmppURI_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"xmpp-uri"];
    v5 = objc_msgSend(v21, "initWithObjectsAndKeys:", v28, v27, v26, v25, v23, v24, v20, v19, v18, v17, v16, v15, v14, v6, v13, v7, v8,
                   v9,
                   0);

    v10 = +[CoreDAVItem parseRuleCache];
    v11 = NSStringFromClass(v22);
    [v10 setObject:v5 forKey:v11];
  }
  return v5;
}

- (CoreDAVLeafItem)apsBundleID
{
  return self->_apsBundleID;
}

- (void)setApsBundleID:(id)a3
{
}

- (CoreDAVLeafItem)courierServer
{
  return self->_courierServer;
}

- (void)setCourierServer:(id)a3
{
}

- (CoreDAVItemWithHrefChildItem)subscriptionURL
{
  return self->_subscriptionURL;
}

- (void)setSubscriptionURL:(id)a3
{
}

- (CoreDAVItemWithHrefChildItem)tokenURL
{
  return self->_tokenURL;
}

- (void)setTokenURL:(id)a3
{
}

- (CoreDAVLeafItem)apsEnv
{
  return self->_apsEnv;
}

- (void)setApsEnv:(id)a3
{
}

- (CoreDAVLeafItem)refreshInterval
{
  return self->_refreshInterval;
}

- (void)setRefreshInterval:(id)a3
{
}

- (CoreDAVLeafItem)xmppServer
{
  return self->_xmppServer;
}

- (void)setXmppServer:(id)a3
{
}

- (CoreDAVLeafItem)xmppURI
{
  return self->_xmppURI;
}

- (void)setXmppURI:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xmppURI, 0);
  objc_storeStrong((id *)&self->_xmppServer, 0);
  objc_storeStrong((id *)&self->_refreshInterval, 0);
  objc_storeStrong((id *)&self->_apsEnv, 0);
  objc_storeStrong((id *)&self->_tokenURL, 0);
  objc_storeStrong((id *)&self->_subscriptionURL, 0);
  objc_storeStrong((id *)&self->_courierServer, 0);
  objc_storeStrong((id *)&self->_apsBundleID, 0);
}

@end