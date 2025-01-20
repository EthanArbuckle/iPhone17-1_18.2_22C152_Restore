@interface CoreDAVItem
+ (id)copyParseRules;
+ (id)parseRuleCache;
- (BOOL)useCDATA;
- (BOOL)validate;
- (CoreDAVItem)init;
- (CoreDAVItem)initWithNameSpace:(id)a3 andName:(id)a4;
- (NSData)payload;
- (NSMutableArray)extraChildItems;
- (NSMutableSet)attributes;
- (NSString)description;
- (NSString)name;
- (NSString)nameSpace;
- (id)copyParseRules;
- (id)generateXMLString;
- (id)hashString;
- (id)payloadAsString;
- (int64_t)payloadAsNSInteger;
- (void)parserFoundAttributes:(id)a3;
- (void)parserFoundUnrecognizedElement:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setExtraChildItems:(id)a3;
- (void)setName:(id)a3;
- (void)setNameSpace:(id)a3;
- (void)setPayload:(id)a3;
- (void)setPayloadAsString:(id)a3;
- (void)setUseCDATA:(BOOL)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVItem

- (CoreDAVItem)init
{
}

- (CoreDAVItem)initWithNameSpace:(id)a3 andName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CoreDAVItem;
  v9 = [(CoreDAVItem *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_nameSpace, a3);
    objc_storeStrong((id *)&v10->_name, a4);
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    attributes = v10->_attributes;
    v10->_attributes = v11;

    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    extraChildItems = v10->_extraChildItems;
    v10->_extraChildItems = v13;

    v15 = (NSData *)objc_alloc_init(MEMORY[0x263EFF990]);
    payload = v10->_payload;
    v10->_payload = v15;
  }
  return v10;
}

- (NSString)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v8.receiver = self;
  v8.super_class = (Class)CoreDAVItem;
  v4 = [(CoreDAVItem *)&v8 description];
  v5 = [(CoreDAVItem *)self nameSpace];
  v6 = [(CoreDAVItem *)self name];
  [v3 appendFormat:@"[%@]: %@%@", v4, v5, v6];

  return (NSString *)v3;
}

- (id)hashString
{
  id v3 = [(CoreDAVItem *)self extraChildItems];
  v4 = [v3 valueForKey:@"hashString"];

  v5 = [v4 componentsJoinedByString:@",\n\nNext Child:\n"];
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = [(CoreDAVItem *)self payloadAsString];
  }
  id v7 = NSString;
  objc_super v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  v10 = [(CoreDAVItem *)self nameSpace];
  v11 = [(CoreDAVItem *)self name];
  v12 = [(CoreDAVItem *)self attributes];
  v13 = [v7 stringWithFormat:@"[%@], namespace: [%@], name: [%@], payload: [%@], attributes: [%@], children: [%@]", v9, v10, v11, v6, v12, v5];

  return v13;
}

+ (id)copyParseRules
{
  return 0;
}

- (id)copyParseRules
{
  v2 = objc_opt_class();
  return (id)[v2 copyParseRules];
}

+ (id)parseRuleCache
{
  if (parseRuleCache_onceToken != -1) {
    dispatch_once(&parseRuleCache_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)parseRuleCache_retVal;
  return v2;
}

uint64_t __29__CoreDAVItem_parseRuleCache__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263EFF8E0]);
  uint64_t v1 = parseRuleCache_retVal;
  parseRuleCache_retVal = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (void)parserFoundUnrecognizedElement:(id)a3
{
  id v4 = a3;
  id v5 = [(CoreDAVItem *)self extraChildItems];
  [v5 addObject:v4];
}

- (void)parserFoundAttributes:(id)a3
{
  id v4 = (id)[a3 mutableCopy];
  [(CoreDAVItem *)self setAttributes:v4];
}

- (void)write:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CoreDAVItem *)self childrenToWrite];
  if ([v5 count])
  {
    v6 = [(CoreDAVItem *)self name];
    id v7 = [(CoreDAVItem *)self nameSpace];
    [v4 startElement:v6 inNamespace:v7 withAttributeNamesAndValues:0];

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "write:", v4, (void)v18);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    v13 = [(CoreDAVItem *)self name];
    v14 = [(CoreDAVItem *)self nameSpace];
    [v4 endElement:v13 inNamespace:v14];
  }
  else
  {
    BOOL useCDATA = self->_useCDATA;
    v13 = [(CoreDAVItem *)self name];
    v16 = [(CoreDAVItem *)self nameSpace];
    v17 = [(CoreDAVItem *)self payloadAsString];
    if (useCDATA) {
      [v4 appendElement:v13 inNamespace:v16 withStringContentAsCDATA:v17 withAttributeNamesAndValues:0];
    }
    else {
      [v4 appendElement:v13 inNamespace:v16 withStringContent:v17 withAttributeNamesAndValues:0];
    }
  }
}

- (BOOL)validate
{
  return 1;
}

- (id)payloadAsString
{
  id v3 = [NSString alloc];
  id v4 = [(CoreDAVItem *)self payload];
  id v5 = (void *)[v3 initWithData:v4 encoding:4];

  return v5;
}

- (int64_t)payloadAsNSInteger
{
  v2 = [(CoreDAVItem *)self payloadAsString];
  id v3 = v2;
  if (v2) {
    int64_t v4 = (int)[v2 intValue];
  }
  else {
    int64_t v4 = 0;
  }

  return v4;
}

- (void)setPayloadAsString:(id)a3
{
  id v4 = [a3 dataUsingEncoding:4];
  [(CoreDAVItem *)self setPayload:v4];
}

- (id)generateXMLString
{
  id v3 = objc_alloc_init(CoreDAVXMLData);
  [(CoreDAVItem *)self write:v3];
  id v4 = [(CoreDAVXMLData *)v3 data];
  id v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (void)setNameSpace:(id)a3
{
}

- (NSMutableSet)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (NSMutableArray)extraChildItems
{
  return self->_extraChildItems;
}

- (void)setExtraChildItems:(id)a3
{
}

- (NSData)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (BOOL)useCDATA
{
  return self->_useCDATA;
}

- (void)setUseCDATA:(BOOL)a3
{
  self->_BOOL useCDATA = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_extraChildItems, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end