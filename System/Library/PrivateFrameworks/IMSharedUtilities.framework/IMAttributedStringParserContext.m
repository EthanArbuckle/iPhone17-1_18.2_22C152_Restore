@interface IMAttributedStringParserContext
- (BOOL)shouldPreprocess;
- (IMAttributedStringParserContext)initWithAttributedString:(id)a3;
- (NSArray)resultsForLogging;
- (NSAttributedString)inString;
- (NSString)name;
- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5;
- (void)dealloc;
@end

@implementation IMAttributedStringParserContext

- (IMAttributedStringParserContext)initWithAttributedString:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMAttributedStringParserContext;
  v4 = [(IMAttributedStringParserContext *)&v6 init];
  if (v4) {
    v4->_inString = (NSAttributedString *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMAttributedStringParserContext;
  [(IMAttributedStringParserContext *)&v3 dealloc];
}

- (NSString)name
{
  return (NSString *)@"Base";
}

- (NSArray)resultsForLogging
{
  return 0;
}

- (BOOL)shouldPreprocess
{
  return 0;
}

- (id)parser:(id)a3 preprocessedAttributesForAttributes:(id)a4 range:(_NSRange)a5
{
  return a4;
}

- (NSAttributedString)inString
{
  return (NSAttributedString *)objc_getProperty(self, a2, 8, 1);
}

@end