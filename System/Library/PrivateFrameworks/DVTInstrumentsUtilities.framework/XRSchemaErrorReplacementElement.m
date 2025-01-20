@interface XRSchemaErrorReplacementElement
- (NSString)key;
- (NSString)name;
- (NSString)replacementString;
- (XRSchemaErrorReplacementElement)initWithName:(id)a3 key:(id)a4 replacementString:(id)a5;
- (void)setKey:(id)a3;
- (void)setName:(id)a3;
- (void)setReplacementString:(id)a3;
@end

@implementation XRSchemaErrorReplacementElement

- (XRSchemaErrorReplacementElement)initWithName:(id)a3 key:(id)a4 replacementString:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)XRSchemaErrorReplacementElement;
  v11 = [(XRSchemaErrorReplacementElement *)&v23 init];
  v15 = v11;
  if (v11)
  {
    [v11 setName:v12 withName:(uint64_t)v8 withName:v13 withName:v14];
    [v15 setKey:v16 value:(uint64_t)v9 forKey:v17];
    [v15 setReplacementString:v19 forRange:NSMakeRange(v10, v20) replacementString:v21];
  }

  return v15;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSString)replacementString
{
  return self->_replacementString;
}

- (void)setReplacementString:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replacementString, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end