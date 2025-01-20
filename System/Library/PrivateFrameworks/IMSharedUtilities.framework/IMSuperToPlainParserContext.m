@interface IMSuperToPlainParserContext
- (IMSuperToPlainParserContext)initWithAttributedString:(id)a3;
- (IMSuperToPlainParserContext)initWithAttributedString:(id)a3 extractLinks:(BOOL)a4;
- (NSMutableString)mutablePlainString;
- (NSString)plainString;
- (id)name;
- (id)resultsForLogging;
- (void)dealloc;
- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6;
@end

@implementation IMSuperToPlainParserContext

- (IMSuperToPlainParserContext)initWithAttributedString:(id)a3
{
  return (IMSuperToPlainParserContext *)MEMORY[0x1F4181798](self, sel_initWithAttributedString_extractLinks_);
}

- (IMSuperToPlainParserContext)initWithAttributedString:(id)a3 extractLinks:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)IMSuperToPlainParserContext;
  v6 = -[IMFromSuperParserContext initWithAttributedString:](&v8, sel_initWithAttributedString_);
  if (v6)
  {
    v6->_mutablePlainString = (NSMutableString *)objc_msgSend(objc_alloc(MEMORY[0x1E4F28E78]), "initWithCapacity:", objc_msgSend(a3, "length"));
    v6->_extractLinks = a4;
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMSuperToPlainParserContext;
  [(IMFromSuperParserContext *)&v3 dealloc];
}

- (id)name
{
  return @"SuperToPlain";
}

- (id)resultsForLogging
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", @"plainString", 0);
}

- (NSString)plainString
{
  return (NSString *)MEMORY[0x1F4181798](self->_mutablePlainString, sel___stringByStrippingAttachmentAndControlCharacters);
}

- (void)parser:(id)a3 foundAttributes:(id)a4 inRange:(_NSRange)a5 characters:(id)a6
{
  objc_super v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKey:", *MEMORY[0x1E4F6C1D0]), "absoluteString");
  BOOL v9 = !self->_extractLinks || v8 == 0;
  if (v9 || (v10 = v8, ([v8 isEqualToString:a6] & 1) != 0))
  {
    mutablePlainString = self->_mutablePlainString;
    [(NSMutableString *)mutablePlainString appendString:a6];
  }
  else
  {
    [(NSMutableString *)self->_mutablePlainString appendFormat:@"%@ <%@>", a6, v10];
  }
}

- (NSMutableString)mutablePlainString
{
  return self->_mutablePlainString;
}

@end