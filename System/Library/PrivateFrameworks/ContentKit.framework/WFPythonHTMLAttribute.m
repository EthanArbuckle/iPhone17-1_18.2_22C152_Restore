@interface WFPythonHTMLAttribute
- (NSString)name;
- (NSString)value;
- (WFPythonHTMLAttribute)initWithName:(id)a3 value:(id)a4;
- (id)description;
@end

@implementation WFPythonHTMLAttribute

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSString)value
{
  return self->_value;
}

- (NSString)name
{
  return self->_name;
}

- (id)description
{
  v3 = NSString;
  v9.receiver = self;
  v9.super_class = (Class)WFPythonHTMLAttribute;
  v4 = [(WFPythonHTMLAttribute *)&v9 description];
  v5 = [(WFPythonHTMLAttribute *)self name];
  v6 = [(WFPythonHTMLAttribute *)self value];
  v7 = [v3 stringWithFormat:@"%@: %@=%@", v4, v5, v6];

  return v7;
}

- (WFPythonHTMLAttribute)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WFPythonHTMLAttribute;
  v8 = [(WFPythonHTMLAttribute *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    name = v8->_name;
    v8->_name = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    value = v8->_value;
    v8->_value = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

@end