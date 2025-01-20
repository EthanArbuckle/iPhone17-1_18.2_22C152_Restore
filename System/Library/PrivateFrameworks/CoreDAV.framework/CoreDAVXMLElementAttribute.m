@interface CoreDAVXMLElementAttribute
- (CoreDAVXMLElementAttribute)init;
- (CoreDAVXMLElementAttribute)initWithNameSpace:(id)a3 name:(id)a4 value:(id)a5;
- (NSString)name;
- (NSString)nameSpace;
- (NSString)value;
- (id)description;
- (void)setName:(id)a3;
- (void)setNameSpace:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CoreDAVXMLElementAttribute

- (CoreDAVXMLElementAttribute)init
{
}

- (CoreDAVXMLElementAttribute)initWithNameSpace:(id)a3 name:(id)a4 value:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v9 || (v11 = v10, ![v9 length]))
  {
    id v15 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Non-nil and non-empty 'name' required." userInfo:0];
    objc_exception_throw(v15);
  }
  v16.receiver = self;
  v16.super_class = (Class)CoreDAVXMLElementAttribute;
  v12 = [(CoreDAVXMLElementAttribute *)&v16 init];
  v13 = v12;
  if (v12)
  {
    [(CoreDAVXMLElementAttribute *)v12 setNameSpace:v8];
    [(CoreDAVXMLElementAttribute *)v13 setName:v9];
    [(CoreDAVXMLElementAttribute *)v13 setValue:v11];
  }

  return v13;
}

- (id)description
{
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)CoreDAVXMLElementAttribute;
  v4 = [(CoreDAVXMLElementAttribute *)&v10 description];
  v5 = [(CoreDAVXMLElementAttribute *)self nameSpace];
  v6 = [(CoreDAVXMLElementAttribute *)self name];
  v7 = [(CoreDAVXMLElementAttribute *)self value];
  id v8 = [v3 stringWithFormat:@"[%@], namespace: [%@], name: [%@], value: [%@]", v4, v5, v6, v7];

  return v8;
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

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end