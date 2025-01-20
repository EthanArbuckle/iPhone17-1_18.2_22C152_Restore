@interface CoreDAVMatchResultsItem
+ (id)copyParseRules;
- (CoreDAVLeafItem)calendarDescription;
- (CoreDAVLeafItem)language;
- (CoreDAVLeafItem)rank;
- (CoreDAVLeafItem)region;
- (id)description;
- (void)setCalendarDescription:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setRank:(id)a3;
- (void)setRegion:(id)a3;
@end

@implementation CoreDAVMatchResultsItem

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVMatchResultsItem;
  v4 = [(CoreDAVItem *)&v14 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVMatchResultsItem *)self rank];
  v6 = [v5 payloadAsString];
  [v3 appendFormat:@"\n  Rank: [%@]", v6];

  v7 = [(CoreDAVMatchResultsItem *)self language];
  v8 = [v7 payloadAsString];
  [v3 appendFormat:@"\n  Language: [%@]", v8];

  v9 = [(CoreDAVMatchResultsItem *)self region];
  v10 = [v9 payloadAsString];
  [v3 appendFormat:@"\n  Region: [%@]", v10];

  v11 = [(CoreDAVMatchResultsItem *)self calendarDescription];
  v12 = [v11 payloadAsString];
  [v3 appendFormat:@"\n  Description: [%@]", v12];

  return v3;
}

+ (id)copyParseRules
{
  id v3 = +[CoreDAVItem parseRuleCache];
  v4 = NSStringFromClass((Class)a1);
  v5 = [v3 objectForKey:v4];

  if (!v5)
  {
    id v17 = objc_alloc(NSDictionary);
    v16 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"rank" objectClass:objc_opt_class() setterMethod:sel_setRank_];
    v15 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"rank"];
    v6 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"language" objectClass:objc_opt_class() setterMethod:sel_setLanguage_];
    v7 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"language"];
    v8 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"region" objectClass:objc_opt_class() setterMethod:sel_setRegion_];
    v9 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"region"];
    v10 = +[CoreDAVParseRule ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:@"http://calendarserver.org/ns/" elementName:@"description" objectClass:objc_opt_class() setterMethod:sel_setCalendarDescription_];
    v11 = [NSString stringWithFormat:@"%@:%@", @"http://calendarserver.org/ns/", @"description"];
    v5 = objc_msgSend(v17, "initWithObjectsAndKeys:", v16, v15, v6, v7, v8, v9, v10, v11, 0);

    v12 = +[CoreDAVItem parseRuleCache];
    v13 = NSStringFromClass((Class)a1);
    [v12 setObject:v5 forKey:v13];
  }
  return v5;
}

- (CoreDAVLeafItem)rank
{
  return self->_rank;
}

- (void)setRank:(id)a3
{
}

- (CoreDAVLeafItem)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
}

- (CoreDAVLeafItem)region
{
  return self->_region;
}

- (void)setRegion:(id)a3
{
}

- (CoreDAVLeafItem)calendarDescription
{
  return self->_calendarDescription;
}

- (void)setCalendarDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarDescription, 0);
  objc_storeStrong((id *)&self->_region, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_rank, 0);
}

@end