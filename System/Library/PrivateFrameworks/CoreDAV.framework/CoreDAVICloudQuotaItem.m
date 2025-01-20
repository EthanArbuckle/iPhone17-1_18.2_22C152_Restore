@interface CoreDAVICloudQuotaItem
+ (id)copyParseRules;
- (CoreDAVLeafItem)otherBytes;
- (CoreDAVLeafItem)resourceBytes;
- (CoreDAVLeafItem)resourceCount;
- (id)description;
- (void)setOtherBytes:(id)a3;
- (void)setResourceBytes:(id)a3;
- (void)setResourceCount:(id)a3;
@end

@implementation CoreDAVICloudQuotaItem

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v12.receiver = self;
  v12.super_class = (Class)CoreDAVICloudQuotaItem;
  v4 = [(CoreDAVItem *)&v12 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVICloudQuotaItem *)self resourceBytes];
  v6 = [v5 payloadAsString];
  [v3 appendFormat:@"\n  ResourceBytes: [%@]", v6];

  v7 = [(CoreDAVICloudQuotaItem *)self resourceCount];
  v8 = [v7 payloadAsString];
  [v3 appendFormat:@"\n  ResourceCount: [%@]", v8];

  v9 = [(CoreDAVICloudQuotaItem *)self otherBytes];
  v10 = [v9 payloadAsString];
  [v3 appendFormat:@"\n  OtherBytes: [%@]", v10];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v15 = objc_alloc(NSDictionary);
    v6 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"urn:mobileme:davservices" elementName:@"resource-bytes" objectClass:objc_opt_class() setterMethod:sel_setResourceBytes_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"urn:mobileme:davservices", @"resource-bytes"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"urn:mobileme:davservices" elementName:@"resource-count" objectClass:objc_opt_class() setterMethod:sel_setResourceCount_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"urn:mobileme:davservices", @"resource-count"];
    v10 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"urn:mobileme:davservices" elementName:@"other-bytes" objectClass:objc_opt_class() setterMethod:sel_setOtherBytes_];
    v11 = [NSString stringWithFormat:@"%@:%@", @"urn:mobileme:davservices", @"other-bytes"];
    v5 = objc_msgSend(v15, "initWithObjectsAndKeys:", v6, v7, v8, v9, v10, v11, 0);

    objc_super v12 = +[CoreDAVItem parseRuleCache];
    v13 = NSStringFromClass((Class)a1);
    [v12 setObject:v5 forKey:v13];
  }
  return v5;
}

- (CoreDAVLeafItem)resourceBytes
{
  return self->_resourceBytes;
}

- (void)setResourceBytes:(id)a3
{
}

- (CoreDAVLeafItem)resourceCount
{
  return self->_resourceCount;
}

- (void)setResourceCount:(id)a3
{
}

- (CoreDAVLeafItem)otherBytes
{
  return self->_otherBytes;
}

- (void)setOtherBytes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otherBytes, 0);
  objc_storeStrong((id *)&self->_resourceCount, 0);
  objc_storeStrong((id *)&self->_resourceBytes, 0);
}

@end