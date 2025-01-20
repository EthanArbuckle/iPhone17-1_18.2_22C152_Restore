@interface CoreDAVItemParserMapping
- (Class)parseClass;
- (CoreDAVItemParserMapping)initWithNameSpace:(id)a3 name:(id)a4 parseClass:(Class)a5;
- (NSString)name;
- (NSString)nameSpace;
- (id)description;
- (void)setName:(id)a3;
- (void)setNameSpace:(id)a3;
- (void)setParseClass:(Class)a3;
@end

@implementation CoreDAVItemParserMapping

- (CoreDAVItemParserMapping)initWithNameSpace:(id)a3 name:(id)a4 parseClass:(Class)a5
{
  id v9 = a3;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CoreDAVItemParserMapping;
  v11 = [(CoreDAVItemParserMapping *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_nameSpace, a3);
    objc_storeStrong((id *)&v12->_name, a4);
    v12->_parseClass = a5;
  }

  return v12;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVItemParserMapping;
  v4 = [(CoreDAVItemParserMapping *)&v10 description];
  v5 = [(CoreDAVItemParserMapping *)self nameSpace];
  v6 = [(CoreDAVItemParserMapping *)self name];
  v7 = NSStringFromClass([(CoreDAVItemParserMapping *)self parseClass]);
  v8 = [v3 stringWithFormat:@"[%@], namespace: [%@], name: [%@] parse class: [%@]", v4, v5, v6, v7];

  return v8;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (void)setNameSpace:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (Class)parseClass
{
  return self->_parseClass;
}

- (void)setParseClass:(Class)a3
{
  self->_parseClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
}

@end