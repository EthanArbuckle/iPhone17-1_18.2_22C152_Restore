@interface CalDAVCalendarServerResourceChangeDeletedElement
- (BOOL)hadMoreInstances;
- (CalDAVCalendarServerResourceChangeDeletedElement)init;
- (ICSDateValue)nextInstance;
- (NSString)componentType;
- (NSString)displayName;
- (NSString)summary;
- (id)copyParseRules;
- (void)setComponentType:(id)a3;
- (void)setDeletedDetails:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setHadMoreInstances:(BOOL)a3;
- (void)setNextInstance:(id)a3;
- (void)setSummary:(id)a3;
@end

@implementation CalDAVCalendarServerResourceChangeDeletedElement

- (CalDAVCalendarServerResourceChangeDeletedElement)init
{
  return [(CoreDAVItem *)self initWithNameSpace:*MEMORY[0x263F34DA8] andName:@"deleted"];
}

- (void)setDeletedDetails:(id)a3
{
  id v4 = a3;
  v5 = [v4 componentType];
  [(CalDAVCalendarServerResourceChangeDeletedElement *)self setComponentType:v5];

  v6 = [v4 summary];
  [(CalDAVCalendarServerResourceChangeDeletedElement *)self setSummary:v6];

  v7 = [v4 displayName];
  [(CalDAVCalendarServerResourceChangeDeletedElement *)self setDisplayName:v7];

  v8 = [v4 nextInstance];
  [(CalDAVCalendarServerResourceChangeDeletedElement *)self setNextInstance:v8];

  uint64_t v9 = [v4 hadMoreInstances];
  [(CalDAVCalendarServerResourceChangeDeletedElement *)self setHadMoreInstances:v9];
}

- (id)copyParseRules
{
  v10.receiver = self;
  v10.super_class = (Class)CalDAVCalendarServerResourceChangeDeletedElement;
  id v2 = [(CalDAVCalendarServerResourceChangeElement *)&v10 copyParseRules];
  v3 = (void *)[v2 mutableCopy];
  id v4 = objc_alloc(NSDictionary);
  uint64_t v5 = *MEMORY[0x263F34DA8];
  v6 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:1 nameSpace:*MEMORY[0x263F34DA8] elementName:@"deleted-details" objectClass:objc_opt_class() setterMethod:sel_setDeletedDetails_];
  v7 = [NSString stringWithFormat:@"%@:%@", v5, @"deleted-details"];
  v8 = objc_msgSend(v4, "initWithObjectsAndKeys:", v6, v7, 0);

  [v3 addEntriesFromDictionary:v8];
  return v3;
}

- (NSString)componentType
{
  return self->_componentType;
}

- (void)setComponentType:(id)a3
{
}

- (NSString)summary
{
  return self->_summary;
}

- (void)setSummary:(id)a3
{
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setDisplayName:(id)a3
{
}

- (ICSDateValue)nextInstance
{
  return self->_nextInstance;
}

- (void)setNextInstance:(id)a3
{
}

- (BOOL)hadMoreInstances
{
  return self->_hadMoreInstances;
}

- (void)setHadMoreInstances:(BOOL)a3
{
  self->_hadMoreInstances = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextInstance, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_summary, 0);
  objc_storeStrong((id *)&self->_componentType, 0);
}

@end