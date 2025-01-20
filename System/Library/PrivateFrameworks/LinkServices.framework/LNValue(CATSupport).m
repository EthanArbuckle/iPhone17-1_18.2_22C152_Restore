@interface LNValue(CATSupport)
- (id)cat_definitionXML;
- (id)cat_variableXML;
- (uint64_t)cat_parameterName;
@end

@implementation LNValue(CATSupport)

- (id)cat_variableXML
{
  v2 = [a1 valueType];
  if ([v2 isMemberOfClass:objc_opt_class()])
  {
    v3 = 0;
  }
  else
  {
    v4 = [a1 valueType];
    v3 = objc_msgSend(v4, "cat_keyPath");
  }
  v5 = NSString;
  v6 = objc_msgSend(a1, "cat_parameterName");
  if (v3)
  {
    v7 = [@"." stringByAppendingString:v3];
  }
  else
  {
    v7 = &stru_1EF7D9D20;
  }
  v8 = [a1 valueType];
  uint64_t v9 = objc_msgSend(v8, "cat_keyPath");
  v10 = (void *)v9;
  if (v9) {
    v11 = (__CFString *)v9;
  }
  else {
    v11 = &stru_1EF7D9D20;
  }
  v12 = [v5 stringWithFormat:@"<var name=\"%@%@\" itemformat=\"%@\" />", v6, v7, v11];

  if (v3) {
  return v12;
  }
}

- (id)cat_definitionXML
{
  v2 = NSString;
  v3 = objc_msgSend(a1, "cat_parameterName");
  v4 = [a1 valueType];
  v5 = objc_msgSend(v4, "cat_dialogType");
  v6 = [v2 stringWithFormat:@"<parameter name=\"%@\" type=\"%@\"/>", v3, v5];

  return v6;
}

- (uint64_t)cat_parameterName
{
  return objc_msgSend(NSString, "stringWithFormat:", @"parameter0x%lx", a1);
}

@end