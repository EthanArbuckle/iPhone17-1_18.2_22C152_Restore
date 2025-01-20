@interface CalDAVCalendarServerResourceChangeElement
- (CalDAVCalendarServerResourceChangeElement)init;
- (CalDAVUpdateOwnerItem)changedBy;
- (NSURL)fullHrefURL;
- (id)copyParseRules;
- (void)setChangedBy:(id)a3;
@end

@implementation CalDAVCalendarServerResourceChangeElement

- (CalDAVCalendarServerResourceChangeElement)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"CalDAVCalendarServerResourceChangeElement.m", 19, @"Don't initialize CalDAVCalendarServerResourceChange directly. Use a subclass, dude." object file lineNumber description];

  return 0;
}

- (NSURL)fullHrefURL
{
  v5.receiver = self;
  v5.super_class = (Class)CalDAVCalendarServerResourceChangeElement;
  v2 = [(CoreDAVItemWithHrefChildItem *)&v5 href];
  v3 = [v2 payloadAsFullURL];

  return (NSURL *)v3;
}

- (id)copyParseRules
{
  id v2 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *MEMORY[0x263F34E10];
  uint64_t v4 = *MEMORY[0x263F34E50];
  objc_super v5 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:1 maximumNumber:1 nameSpace:*MEMORY[0x263F34E10] elementName:*MEMORY[0x263F34E50] objectClass:objc_opt_class() setterMethod:sel_setHref_];
  v6 = [NSString stringWithFormat:@"%@:%@", v3, v4];
  uint64_t v7 = *MEMORY[0x263F34DA8];
  v8 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"changed-by" objectClass:objc_opt_class() setterMethod:sel_setChangedBy_];
  v9 = [NSString stringWithFormat:@"%@:%@", v7, @"changed-by"];
  v10 = objc_msgSend(v2, "initWithObjectsAndKeys:", v5, v6, v8, v9, 0);

  return v10;
}

- (CalDAVUpdateOwnerItem)changedBy
{
  return self->_changedBy;
}

- (void)setChangedBy:(id)a3
{
}

- (void).cxx_destruct
{
}

@end