@interface IMXMLParserContext
- (IMXMLParserContext)initWithContent:(id)a3;
- (IMXMLParserContext)initWithContentAsData:(id)a3;
- (NSArray)resultsForLogging;
- (NSData)inContentAsData;
- (NSString)name;
- (id)inContent;
- (void)dealloc;
@end

@implementation IMXMLParserContext

- (IMXMLParserContext)initWithContent:(id)a3
{
  [a3 dataUsingEncoding:4];

  return (IMXMLParserContext *)MEMORY[0x1F4181798](self, sel_initWithContentAsData_);
}

- (IMXMLParserContext)initWithContentAsData:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMXMLParserContext;
  v4 = [(IMXMLParserContext *)&v6 init];
  if (v4)
  {
    v4->_inContentAsData = (NSData *)a3;
    [(IMXMLParserContext *)v4 reset];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMXMLParserContext;
  [(IMXMLParserContext *)&v3 dealloc];
}

- (id)inContent
{
  v2 = (void *)[[NSString alloc] initWithData:self->_inContentAsData encoding:4];

  return v2;
}

- (NSString)name
{
  return (NSString *)@"Base";
}

- (NSArray)resultsForLogging
{
  return 0;
}

- (NSData)inContentAsData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

@end