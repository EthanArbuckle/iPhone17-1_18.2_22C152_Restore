@interface CalDAVCalendarServerChangedPropertyItem
- (CalDAVCalendarServerChangedPropertyItem)initWithNameSpace:(id)a3 andName:(id)a4;
- (NSMutableSet)changedParameters;
- (NSString)nameAttribute;
- (NSString)typeAttribute;
- (id)copyParseRules;
- (void)addChangedParameter:(id)a3;
- (void)parserFoundAttributes:(id)a3;
- (void)setChangedParameters:(id)a3;
- (void)setNameAttribute:(id)a3;
- (void)setTypeAttribute:(id)a3;
@end

@implementation CalDAVCalendarServerChangedPropertyItem

- (CalDAVCalendarServerChangedPropertyItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)CalDAVCalendarServerChangedPropertyItem;
  v4 = [(CoreDAVItem *)&v8 initWithNameSpace:a3 andName:a4];
  if (v4)
  {
    v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    changedParameters = v4->_changedParameters;
    v4->_changedParameters = v5;
  }
  return v4;
}

- (void)parserFoundAttributes:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    uint64_t v8 = *MEMORY[0x263F34EC0];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        v11 = [v10 name];
        int v12 = [v11 isEqualToString:v8];

        if (v12)
        {
          v13 = [v10 value];
          [(CalDAVCalendarServerChangedPropertyItem *)self setNameAttribute:v13];
        }
        v14 = [v10 name];
        int v15 = [v14 isEqualToString:@"change-type"];

        if (v15)
        {
          v16 = [v10 value];
          [(CalDAVCalendarServerChangedPropertyItem *)self setTypeAttribute:v16];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }
}

- (void)addChangedParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(CalDAVCalendarServerChangedPropertyItem *)self changedParameters];
  [v5 addObject:v4];
}

- (id)copyParseRules
{
  id v2 = objc_alloc(NSDictionary);
  uint64_t v3 = *MEMORY[0x263F34DA8];
  id v4 = [MEMORY[0x263F34B68] ruleWithMinimumNumber:0 maximumNumber:0x7FFFFFFFLL nameSpace:*MEMORY[0x263F34DA8] elementName:@"changed-parameter" objectClass:objc_opt_class() setterMethod:sel_addChangedParameter_];
  id v5 = [NSString stringWithFormat:@"%@:%@", v3, @"changed-parameter"];
  uint64_t v6 = objc_msgSend(v2, "initWithObjectsAndKeys:", v4, v5, 0);

  return v6;
}

- (NSMutableSet)changedParameters
{
  return self->_changedParameters;
}

- (void)setChangedParameters:(id)a3
{
}

- (NSString)nameAttribute
{
  return self->_nameAttribute;
}

- (void)setNameAttribute:(id)a3
{
}

- (NSString)typeAttribute
{
  return self->_typeAttribute;
}

- (void)setTypeAttribute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeAttribute, 0);
  objc_storeStrong((id *)&self->_nameAttribute, 0);
  objc_storeStrong((id *)&self->_changedParameters, 0);
}

@end