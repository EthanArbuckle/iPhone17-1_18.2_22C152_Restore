@interface OrgXmlSaxSAXException
+ (const)__metadata;
- (OrgXmlSaxSAXException)init;
- (OrgXmlSaxSAXException)initWithJavaLangException:(id)a3;
- (OrgXmlSaxSAXException)initWithNSString:(id)a3;
- (OrgXmlSaxSAXException)initWithNSString:(id)a3 withJavaLangException:(id)a4;
- (id)description;
- (id)getException;
- (id)getMessage;
- (void)dealloc;
@end

@implementation OrgXmlSaxSAXException

- (OrgXmlSaxSAXException)init
{
  return self;
}

- (OrgXmlSaxSAXException)initWithNSString:(id)a3
{
  return self;
}

- (OrgXmlSaxSAXException)initWithJavaLangException:(id)a3
{
  return self;
}

- (OrgXmlSaxSAXException)initWithNSString:(id)a3 withJavaLangException:(id)a4
{
  return self;
}

- (id)getMessage
{
  v4.receiver = self;
  v4.super_class = (Class)OrgXmlSaxSAXException;
  id result = [(JavaLangThrowable *)&v4 getMessage];
  if (!result)
  {
    id result = self->exception_;
    if (result) {
      return [result getMessage];
    }
  }
  return result;
}

- (id)getException
{
  return self->exception_;
}

- (id)description
{
  if (self->exception_)
  {
    exception = self->exception_;
    return [(JavaLangThrowable *)exception description];
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)OrgXmlSaxSAXException;
    return [(JavaLangThrowable *)&v4 description];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxSAXException;
  [(JavaLangThrowable *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_1004839C0;
}

@end