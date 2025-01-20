@interface OrgXmlSaxSAXParseException
+ (const)__metadata;
- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withInt:(int)a7;
- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withInt:(int)a7 withJavaLangException:(id)a8;
- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withOrgXmlSaxLocator:(id)a4;
- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withOrgXmlSaxLocator:(id)a4 withJavaLangException:(id)a5;
- (id)getPublicId;
- (id)getSystemId;
- (int)getColumnNumber;
- (int)getLineNumber;
- (void)dealloc;
- (void)init__WithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6;
@end

@implementation OrgXmlSaxSAXParseException

- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withOrgXmlSaxLocator:(id)a4
{
  return self;
}

- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withOrgXmlSaxLocator:(id)a4 withJavaLangException:(id)a5
{
  return self;
}

- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withInt:(int)a7
{
  return self;
}

- (OrgXmlSaxSAXParseException)initWithNSString:(id)a3 withNSString:(id)a4 withNSString:(id)a5 withInt:(int)a6 withInt:(int)a7 withJavaLangException:(id)a8
{
  return self;
}

- (void)init__WithNSString:(id)a3 withNSString:(id)a4 withInt:(int)a5 withInt:(int)a6
{
  self->lineNumber_ = a5;
  self->columnNumber_ = a6;
}

- (id)getPublicId
{
  return self->publicId_;
}

- (id)getSystemId
{
  return self->systemId_;
}

- (int)getLineNumber
{
  return self->lineNumber_;
}

- (int)getColumnNumber
{
  return self->columnNumber_;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OrgXmlSaxSAXParseException;
  [(OrgXmlSaxSAXException *)&v3 dealloc];
}

+ (const)__metadata
{
  return (const J2ObjcClassInfo *)&unk_10042CE20;
}

@end