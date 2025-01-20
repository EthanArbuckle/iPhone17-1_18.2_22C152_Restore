@interface CoreDAVPropertySearchItem
- (CoreDAVLeafItem)prop;
- (CoreDAVPropertySearchItem)init;
- (CoreDAVPropertySearchItem)initWithSearchPropertyNameSpace:(id)a3 andName:(id)a4;
- (NSString)match;
- (NSString)matchTypeAttribute;
- (id)description;
- (void)setMatch:(id)a3;
- (void)setMatchTypeAttribute:(id)a3;
- (void)setProp:(id)a3;
- (void)write:(id)a3;
@end

@implementation CoreDAVPropertySearchItem

- (CoreDAVPropertySearchItem)init
{
  return [(CoreDAVItem *)self initWithNameSpace:@"DAV:" andName:@"property-search"];
}

- (CoreDAVPropertySearchItem)initWithSearchPropertyNameSpace:(id)a3 andName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(CoreDAVPropertySearchItem *)self init];
  if (v8)
  {
    v9 = [(CoreDAVItem *)[CoreDAVLeafItem alloc] initWithNameSpace:v6 andName:v7];
    prop = v8->_prop;
    v8->_prop = v9;
  }
  return v8;
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  v9.receiver = self;
  v9.super_class = (Class)CoreDAVPropertySearchItem;
  v4 = [(CoreDAVItem *)&v9 description];
  [v3 appendFormat:@"[%@]", v4];

  v5 = [(CoreDAVPropertySearchItem *)self prop];
  [v3 appendFormat:@"\n  Prop: [%@]", v5];

  id v6 = [(CoreDAVPropertySearchItem *)self match];
  [v3 appendFormat:@"\n  Match: [%@]", v6];

  id v7 = [(CoreDAVPropertySearchItem *)self matchTypeAttribute];
  [v3 appendFormat:@"\n  MatchTypeAttribute: [%@]", v7];

  return v3;
}

- (void)write:(id)a3
{
  id v16 = a3;
  v4 = [(CoreDAVItem *)self name];
  v5 = [(CoreDAVItem *)self nameSpace];
  [v16 startElement:v4 inNamespace:v5 withAttributeNamesAndValues:0];

  [v16 startElement:@"prop" inNamespace:@"DAV:" withAttributeNamesAndValues:0];
  id v6 = [(CoreDAVPropertySearchItem *)self prop];
  id v7 = [v6 name];
  v8 = [(CoreDAVPropertySearchItem *)self prop];
  objc_super v9 = [v8 nameSpace];
  [v16 appendElement:v7 inNamespace:v9 withStringContent:0 withAttributeNamesAndValues:0];

  [v16 endElement:@"prop" inNamespace:@"DAV:"];
  v10 = [(CoreDAVPropertySearchItem *)self match];

  if (v10)
  {
    v11 = [(CoreDAVPropertySearchItem *)self matchTypeAttribute];

    v12 = [(CoreDAVPropertySearchItem *)self match];
    if (v11)
    {
      v13 = [(CoreDAVPropertySearchItem *)self matchTypeAttribute];
      objc_msgSend(v16, "appendElement:inNamespace:withStringContent:withAttributeNamesAndValues:", @"match", @"DAV:", v12, @"match-type", v13, 0);
    }
    else
    {
      [v16 appendElement:@"match" inNamespace:@"DAV:" withStringContent:v12 withAttributeNamesAndValues:0];
    }
  }
  v14 = [(CoreDAVItem *)self name];
  v15 = [(CoreDAVItem *)self nameSpace];
  [v16 endElement:v14 inNamespace:v15];
}

- (CoreDAVLeafItem)prop
{
  return self->_prop;
}

- (void)setProp:(id)a3
{
}

- (NSString)match
{
  return self->_match;
}

- (void)setMatch:(id)a3
{
}

- (NSString)matchTypeAttribute
{
  return self->_matchTypeAttribute;
}

- (void)setMatchTypeAttribute:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchTypeAttribute, 0);
  objc_storeStrong((id *)&self->_match, 0);
  objc_storeStrong((id *)&self->_prop, 0);
}

@end