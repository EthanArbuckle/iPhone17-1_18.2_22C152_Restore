@interface CoreDAVParseRule
+ (id)ruleWithMinimumNumber:(int64_t)a3 maximumNumber:(int64_t)a4 nameSpace:(id)a5 elementName:(id)a6 objectClass:(Class)a7 setterMethod:(SEL)a8;
- (Class)objectClass;
- (CoreDAVParseRule)initWithMinimumNumber:(int64_t)a3 maximumNumber:(int64_t)a4 nameSpace:(id)a5 elementName:(id)a6 objectClass:(Class)a7 setterMethod:(SEL)a8;
- (NSString)elementName;
- (NSString)nameSpace;
- (SEL)setterMethod;
- (id)description;
- (int64_t)maximumNumber;
- (int64_t)minimumNumber;
@end

@implementation CoreDAVParseRule

+ (id)ruleWithMinimumNumber:(int64_t)a3 maximumNumber:(int64_t)a4 nameSpace:(id)a5 elementName:(id)a6 objectClass:(Class)a7 setterMethod:(SEL)a8
{
  id v14 = a6;
  id v15 = a5;
  v16 = (void *)[objc_alloc((Class)a1) initWithMinimumNumber:a3 maximumNumber:a4 nameSpace:v15 elementName:v14 objectClass:a7 setterMethod:a8];

  return v16;
}

- (CoreDAVParseRule)initWithMinimumNumber:(int64_t)a3 maximumNumber:(int64_t)a4 nameSpace:(id)a5 elementName:(id)a6 objectClass:(Class)a7 setterMethod:(SEL)a8
{
  id v15 = a5;
  id v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CoreDAVParseRule;
  v17 = [(CoreDAVParseRule *)&v21 init];
  v18 = v17;
  if (v17)
  {
    v17->_minimumNumber = a3;
    v17->_maximumNumber = a4;
    objc_storeStrong((id *)&v17->_nameSpace, a5);
    objc_storeStrong((id *)&v18->_elementName, a6);
    v18->_objectClass = a7;
    if (a8) {
      SEL v19 = a8;
    }
    else {
      SEL v19 = 0;
    }
    v18->_setterMethod = v19;
  }

  return v18;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"PARSE RULE: namespace %p (%@) elementname %p (%@) object class %p (%@)", self->_nameSpace, self->_nameSpace, self->_elementName, self->_elementName, self->_objectClass, self->_objectClass];
}

- (int64_t)minimumNumber
{
  return self->_minimumNumber;
}

- (int64_t)maximumNumber
{
  return self->_maximumNumber;
}

- (NSString)nameSpace
{
  return self->_nameSpace;
}

- (NSString)elementName
{
  return self->_elementName;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (SEL)setterMethod
{
  if (self->_setterMethod) {
    return self->_setterMethod;
  }
  else {
    return 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elementName, 0);
  objc_storeStrong((id *)&self->_nameSpace, 0);
}

@end